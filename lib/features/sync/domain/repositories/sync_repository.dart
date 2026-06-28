import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/sync_item_entity.dart';

abstract class SyncRepository {
  Future<Either<AppException, void>> enqueueSyncItem(SyncItemEntity item);
  Future<Either<AppException, void>> processSyncQueue();
}
