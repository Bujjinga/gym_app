import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/design_system/design_system.dart';

/// Regression: the content blurred during ordinary scrolling, because
/// RefreshIndicator reports `drag` for any scroll that starts at the top.
void main() {
  bool blurred(WidgetTester tester) => tester.widget<ImageFiltered>(find.byType(ImageFiltered)).enabled;

  Future<void> pump(WidgetTester tester) => tester.pumpWidget(MaterialApp(
        theme: PulseTheme.dark(),
        home: Scaffold(
          body: PulseRefresh(
            onRefresh: () async {},
            child: ListView(children: [for (var i = 0; i < 50; i++) SizedBox(height: 80, child: Text('Row $i'))]),
          ),
        ),
      ));

  testWidgets('scrolling down does not blur', (tester) async {
    await pump(tester);
    final gesture = await tester.startGesture(tester.getCenter(find.byType(ListView)));
    for (var i = 0; i < 10; i++) {
      await gesture.moveBy(const Offset(0, -40));
      await tester.pump(const Duration(milliseconds: 16));
    }
    await tester.pump(const Duration(milliseconds: 400));
    expect(blurred(tester), isFalse);
    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('pulling down past the threshold blurs', (tester) async {
    await pump(tester);
    final gesture = await tester.startGesture(tester.getCenter(find.byType(ListView)));
    for (var i = 0; i < 10; i++) {
      await gesture.moveBy(const Offset(0, 40));
      await tester.pump(const Duration(milliseconds: 16));
    }
    await tester.pump(const Duration(milliseconds: 400));
    expect(blurred(tester), isTrue);
    await gesture.up();
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(blurred(tester), isFalse);
  });
}
