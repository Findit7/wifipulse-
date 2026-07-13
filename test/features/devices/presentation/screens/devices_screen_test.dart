import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wifi_pulse/features/devices/presentation/screens/devices_screen.dart';
import 'package:wifi_pulse/features/devices/presentation/providers/device_provider.dart';

void main() {
  testWidgets('DevicesScreen shows loading initially or idle', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: DevicesScreen(),
        ),
      ),
    );

    // Initial state is idle
    expect(find.text('Pull to refresh or tap scan to discover devices.'), findsOneWidget);
    
    // Tap the scan button
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
  });
}
