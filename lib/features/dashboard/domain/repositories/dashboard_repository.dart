import '../../../../shared/utils/result.dart';
import '../entities/dashboard_entities.dart';

abstract class DashboardRepository {
  Future<Result<DashboardStatus>> getDashboardStatus();
}
