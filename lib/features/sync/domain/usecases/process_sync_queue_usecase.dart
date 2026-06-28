import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../repositories/sync_repository.dart';

class ProcessSyncQueueUseCase {
  final SyncRepository _repository;

  ProcessSyncQueueUseCase(this._repository);

  Future<Either<AppException, void>> execute() {
    return _repository.processSyncQueue();
  }
}
