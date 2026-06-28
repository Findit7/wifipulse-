import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../utils/logger.dart';
import 'app_exception.dart';

class ErrorHandler {
  ErrorHandler._();

  /// Executes an asynchronous operation and catches any errors, converting them to an Either<AppException, T>
  static Future<Either<AppException, T>> execute<T>(Future<T> Function() operation) async {
    try {
      final result = await operation();
      return Right(result);
    } catch (e, stackTrace) {
      AppLog().e('Operation failed', e, stackTrace);
      
      if (e is AppException) {
        return Left(e);
      }
      
      // Default fallback
      return Left(ServerException('An unexpected error occurred.', originalError: e));
    }
  }

  static void showSnackBar(BuildContext context, String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.redAccent : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
