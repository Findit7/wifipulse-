import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../entities/usage_aggregates.dart';
import '../repositories/usage_repository.dart';

class GetUsageSummaryUseCase {
  final UsageRepository _repository;

  GetUsageSummaryUseCase(this._repository);

  Future<Result<UsageSummary>> execute() {
    return _repository.getUsageSummary();
  }
}
