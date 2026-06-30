import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

@riverpod
class SplashController extends _$SplashController {
  Timer? _timer;

  @override
  bool build() {
    _startTimer();
    return false; // Not finished initially
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      state = true;
    });
  }
}
