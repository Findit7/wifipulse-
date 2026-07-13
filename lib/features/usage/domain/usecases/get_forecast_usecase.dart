import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../entities/usage_aggregates.dart';
import '../repositories/usage_repository.dart';

class GetForecastUseCase {
  final UsageRepository _repository;

  GetForecastUseCase(this._repository);

  Future<Result<UsageForecast>> execute() {
    return _repository.getForecast();
  }
}
