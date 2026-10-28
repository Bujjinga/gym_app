import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/design_system/design_system.dart';

Widget _wrap(Widget child) => MaterialApp(theme: PulseTheme.dark(), home: Scaffold(body: Center(child: child)));

void main() {
  testWidgets('exposes the formatted value to screen readers', (tester) async {
    await tester.pumpWidget(_wrap(const RollingNumber(value: 12345)));
    expect(find.bySemanticsLabel('12,345'), findsOneWidget);
  });

  testWidgets('width stays constant while digits roll', (tester) async {
    await tester.pumpWidget(_wrap(const RollingNumber(value: 1111)));
    await tester.pumpAndSettle();
    final before = tester.getSize(find.byType(RollingNumber));

    await tester.pumpWidget(_wrap(const RollingNumber(value: 8888)));
    await tester.pump(const Duration(milliseconds: 300)); // mid-roll
    expect(tester.getSize(find.byType(RollingNumber)), before);
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('8,888'), findsOneWidget);
  });
}
