import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../entities/usage_aggregates.dart';
import '../repositories/usage_repository.dart';

class GetTrendsUseCase {
  final UsageRepository _repository;

  GetTrendsUseCase(this._repository);

  Future<Result<List<DailyUsage>>> executeDaily({int days = 7}) {
    return _repository.getDailyTrends(days: days);
  }
  
  Future<Result<List<WeeklyUsage>>> executeWeekly({int weeks = 4}) {
    return _repository.getWeeklyTrends(weeks: weeks);
  }
  
  Future<Result<List<MonthlyUsage>>> executeMonthly({int months = 12}) {
    return _repository.getMonthlyTrends(months: months);
  }
}
