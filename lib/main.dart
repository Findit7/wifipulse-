import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared/theme/app_theme.dart';
import '../shared/theme/theme_provider.dart';
import 'core/routing/app_router.dart';
import 'core/utils/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase (Assuming options will be provided during compile)
  try {
    // await Firebase.initializeApp(); // Commented out to prevent crash without google-services.json
  } catch (e) {
    AppLog().e('Firebase Init Failed', e);
  }

  runApp(
    const ProviderScope(
      child: WiFiPulseApp(),
    ),
  );
}

class WiFiPulseApp extends ConsumerWidget {
  const WiFiPulseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    final themeMode = ref.watch(themeModeNotifierProvider);

    return MaterialApp.router(
      title: 'WiFiPulse',
      themeMode: themeMode,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
