import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/padding_widget_decorator.dart';

void main() {
  group('PaddingSpec', () {
    test('lerp returns correct PaddingSpec', () {
      const padding1 = EdgeInsets.all(10.0);
      const padding2 = EdgeInsets.all(20.0);
      const spec1 = PaddingSpec(padding1);
      const spec2 = PaddingSpec(padding2);

      final result = spec1.lerp(spec2, 0.5);

      expect(result.padding, equals(const EdgeInsets.all(15.0)));
    });

    test('lerp behaves like EdgeInsets.lerp', () {
      const padding = EdgeInsets.all(10.0);
      const padding2 = EdgeInsets.all(20.0);
      const padding3 = EdgeInsets.all(30.0);
      const spec = PaddingSpec(padding);
      const spec2 = PaddingSpec(padding2);
      const spec3 = PaddingSpec(padding3);

      final lerp1 = spec.lerp(null, 0.5);

      final lerp2 = spec.lerp(spec2, 0.5);
      final lerp3 = spec.lerp(spec3, 0.5);
      final insets1 = EdgeInsets.lerp(padding, null, 0.5);

      final insets2 = EdgeInsets.lerp(padding, padding2, 0.5);
      final insets3 = EdgeInsets.lerp(padding, padding3, 0.5);

      expect(lerp1.padding, equals(insets1));
      expect(lerp2.padding, equals(insets2));
      expect(lerp3.padding, equals(insets3));
    });

    test('copyWith returns new PaddingSpec with updated padding', () {
      const padding1 = EdgeInsets.all(10.0);
      const padding2 = EdgeInsets.all(20.0);
      const spec = PaddingSpec(padding1);

      final result = spec.copyWith(padding: padding2);

      expect(result.padding, equals(padding2));
    });

    test('copyWith returns original PaddingSpec when padding is null', () {
      const padding = EdgeInsets.all(10.0);
      const spec = PaddingSpec(padding);

      final result = spec.copyWith();

      expect(result.padding, equals(padding));
    });

    testWidgets('build returns Padding widget with correct padding',
        (WidgetTester tester) async {
      const padding = EdgeInsets.all(10.0);
      const spec = PaddingSpec(padding);
      const child = SizedBox();

      await tester.pumpWidget(spec.build(child));

      final paddingWidget = tester.widget<Padding>(find.byType(Padding));
      expect(paddingWidget.padding, equals(padding));
    });
  });
}
