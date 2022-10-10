import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_soft_project/app_features/app_settings/presentation/widgets/settings_widget.dart';

void main() {
  testWidgets('Test Settings Widget', (WidgetTester tester) async {
    //
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SettingsWidget(
            labelText: 'Test',
            prefixIcon: Icons.wb_cloudy,
            sufix: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );

    var mySettingsWidget = find.byType(SettingsWidget);

    await tester.pump();

    expect(mySettingsWidget, findsOneWidget);

    expect(
      tester.widget(find.byType(SettingsWidget)),
      isA<SettingsWidget>().having(
        (t) => t.labelText,
        'labelText',
        contains('Test'),
      ),
    );
  });
}
