import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/splash/presentation/providers/splash_provider.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/devices/presentation/screens/devices_screen.dart';
import '../../features/devices/presentation/screens/device_details_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authState = ref.watch(authControllerProvider);
  final isSplashFinished = ref.watch(splashControllerProvider);

  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/devices',
        builder: (context, state) => const DevicesScreen(),
      ),
      GoRoute(
        path: '/devices/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DeviceDetailsScreen(deviceId: id);
        },
      ),
    ],
    redirect: (context, state) {
      if (!isSplashFinished) {
        return state.uri.path == '/splash' ? null : '/splash';
      }

      if (authState.status == AuthStateStatus.loading) return null;

      final user = authState.user;
      final isLoggingIn = state.uri.path == '/login';
      final isRegistering = state.uri.path == '/register';
      final isOnboarding = state.uri.path == '/onboarding';
      final isSplash = state.uri.path == '/splash';

      if (user == null) {
        return (isLoggingIn || isRegistering) ? null : '/login';
      }

      if (!user.hasCompletedOnboarding) {
        return isOnboarding ? null : '/onboarding';
      }

      if (isLoggingIn || isRegistering || isOnboarding || isSplash) {
        return '/';
      }

      return null;
    },
  );
}
