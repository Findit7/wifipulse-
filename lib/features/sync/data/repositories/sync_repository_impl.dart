import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/sync_item_entity.dart';
import '../../domain/repositories/sync_repository.dart';
import '../datasources/sync_local_data_source.dart';
import '../datasources/sync_remote_data_source.dart';
import '../models/sync_item_model.dart';
import '../../../../core/utils/logger.dart';

class SyncRepositoryImpl implements SyncRepository {
  final SyncLocalDataSource _localDataSource;
  final SyncRemoteDataSource _remoteDataSource;

  SyncRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<AppException, void>> enqueueSyncItem(SyncItemEntity item) async {
    return ErrorHandler.execute(() => _localDataSource.insertSyncItem(SyncItemModel.fromEntity(item)));
  }

  @override
  Future<Either<AppException, void>> processSyncQueue() async {
    return ErrorHandler.execute(() async {
      final pendingItems = await _localDataSource.getPendingSyncItems();
      
      if (pendingItems.isEmpty) return;

      AppLog().i('Processing ${pendingItems.length} sync items');

      // Mark as processing
      for (final item in pendingItems) {
        await _localDataSource.updateSyncItemStatus(item.id!, 'PROCESSING');
      }

      try {
        await _remoteDataSource.batchSync(pendingItems);
        
        // Success: Clear from queue
        for (final item in pendingItems) {
          await _localDataSource.deleteSyncItem(item.id!);
        }
      } catch (e) {
        // Handle failure, update retry count
        for (final item in pendingItems) {
          final newRetryCount = item.retryCount + 1;
          // Exponential backoff logic applies in the worker trigger, here we just track status
          if (newRetryCount >= 5) {
            await _localDataSource.updateSyncItemStatus(item.id!, 'PERMANENTLY_FAILED', retryCount: newRetryCount);
            AppLog().e('Sync Item ${item.id} failed permanently.');
          } else {
            await _localDataSource.updateSyncItemStatus(item.id!, 'FAILED', retryCount: newRetryCount);
          }
        }
        throw SyncConflictException('Batch sync failed and items marked for retry. Error: $e');
      }
    });
  }
}
