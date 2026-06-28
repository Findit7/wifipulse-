import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../repositories/security_repository.dart';
import '../../../sync/domain/repositories/sync_repository.dart';
import '../../../sync/domain/entities/sync_item_entity.dart';

class ResolveAlertUseCase {
  final SecurityRepository _repository;
  final SyncRepository _syncRepo;

  ResolveAlertUseCase(this._repository, this._syncRepo);

  Future<Either<AppException, void>> execute(String alertId) async {
    final result = await _repository.resolveAlert(alertId);
    
    return result.bind((_) {
      _syncRepo.enqueueSyncItem(SyncItemEntity(
        entityType: 'ALERT',
        entityId: alertId,
        action: 'UPDATE',
        payload: jsonEncode({'is_read': 1}),
        status: 'PENDING',
        retryCount: 0,
        createdAt: DateTime.now(),
      ));
      return const Right(null);
    });
  }
}
