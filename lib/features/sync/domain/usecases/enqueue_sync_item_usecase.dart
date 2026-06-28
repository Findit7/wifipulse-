import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/sync_item_entity.dart';
import '../repositories/sync_repository.dart';

class EnqueueSyncItemUseCase {
  final SyncRepository _repository;

  EnqueueSyncItemUseCase(this._repository);

  Future<Either<AppException, void>> execute(SyncItemEntity item) {
    return _repository.enqueueSyncItem(item);
  }
}
