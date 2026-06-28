import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
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

    return MaterialApp.router(
      title: 'WiFiPulse',
      themeMode: ThemeMode.dark, // Default to dark as per UI/UX
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.darkTheme, // Simplified for now
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
