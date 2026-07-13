import '../../../../shared/utils/result.dart';
import '../entities/usage_entity.dart';
import '../entities/usage_aggregates.dart';

abstract class UsageRepository {
  Future<Result<void>> recordUsage(UsageEntity usage);
  Future<Result<UsageSummary>> getUsageSummary();
  Future<Result<List<TopDevice>>> getTopDevices({int limit = 5});
  Future<Result<List<DailyUsage>>> getDailyTrends({int days = 7});
  Future<Result<List<WeeklyUsage>>> getWeeklyTrends({int weeks = 4});
  Future<Result<List<MonthlyUsage>>> getMonthlyTrends({int months = 12});
  Future<Result<UsageForecast>> getForecast();
  Future<Result<String>> exportUsageToCsv();
  Future<Result<String>> exportUsageToJson();
}
