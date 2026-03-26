import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:penny_go/widgets/app_button.dart';

void main() {
  testWidgets('AppButton renders text and triggers callback', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(
            text: 'Test Button',
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    // Verify text exists
    expect(find.text('Test Button'), findsOneWidget);

    // Tap and verify callback
    await tester.tap(find.byType(AppButton));
    expect(tapped, true);
  });

  testWidgets('AppButton shows loading indicator', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppButton(
            text: 'Test Button',
            isLoading: true,
            onPressed: null,
          ),
        ),
      ),
    );

    // Verify loading indicator is present
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    // Verify text is hidden or replaced
    expect(find.text('Test Button'), findsNothing);
  });
}
