import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/dashboard_summary_entity.dart';

abstract class DashboardRepository {
  Future<Either<AppException, DashboardSummaryEntity>> getSummary(String userId);
}
