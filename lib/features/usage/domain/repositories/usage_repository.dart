import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/usage_entity.dart';
import '../entities/usage_summary_entity.dart';
import '../../../networks/domain/entities/speed_test_entity.dart';

abstract class UsageRepository {
  Future<Either<AppException, List<UsageEntity>>> getUsageHistory(String networkId);
  Future<Either<AppException, List<SpeedTestEntity>>> getSpeedTests(String networkId);
  Future<Either<AppException, UsageSummaryEntity>> getDailySummary(String networkId);
  Future<Either<AppException, UsageSummaryEntity>> getWeeklySummary(String networkId);
  Future<Either<AppException, UsageSummaryEntity>> getMonthlySummary(String networkId);
}
