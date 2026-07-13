import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../repositories/usage_repository.dart';

class ExportUsageUseCase {
  final UsageRepository _repository;

  ExportUsageUseCase(this._repository);

  Future<Result<String>> executeCsv() {
    return _repository.exportUsageToCsv();
  }
  
  Future<Result<String>> executeJson() {
    return _repository.exportUsageToJson();
  }
}
