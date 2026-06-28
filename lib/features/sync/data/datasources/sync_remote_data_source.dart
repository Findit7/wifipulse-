import 'package:dio/dio.dart';
import '../../../../core/error/app_exception.dart';
import '../models/sync_item_model.dart';

abstract class SyncRemoteDataSource {
  Future<void> batchSync(List<SyncItemModel> items);
}

class SyncRemoteDataSourceImpl implements SyncRemoteDataSource {
  final Dio _dio;

  SyncRemoteDataSourceImpl(this._dio);

  @override
  Future<void> batchSync(List<SyncItemModel> items) async {
    try {
      final payload = items.map((i) => {
        'id': i.id, // client tracking ID
        'entityType': i.entityType,
        'entityId': i.entityId,
        'action': i.action,
        'payload': i.payload,
        'createdAt': i.createdAt.toIso8601String(),
      }).toList();

      final response = await _dio.post('/sync/batch', data: {'items': payload});
      
      if (response.statusCode != 200 && response.statusCode != 207) {
        throw ServerException('Batch sync failed', code: response.statusCode?.toString());
      }
    } on DioException catch (e) {
      throw ServerException('Network error during sync', originalError: e);
    } catch (e) {
      throw ServerException('Unexpected error during batch sync', originalError: e);
    }
  }
}
