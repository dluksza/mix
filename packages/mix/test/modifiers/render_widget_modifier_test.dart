import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('orderSpecs', () {
    test('should order modifiers based on provided order', () {
      final orderOfModifiers = [
        ClipOvalModifierSpec,
        OpacityModifierSpec,
        AlignModifierSpec,
        TransformModifierSpec,
      ];
      final modifiers = <WidgetModifierSpec>[
        const OpacityModifierSpec(1),
        TransformModifierSpec(transform: Matrix4.rotationX(3)),
        const AlignModifierSpec(alignment: Alignment.center),
        const ClipOvalModifierSpec(),
      ];

      final result = orderModifiers(orderOfModifiers, modifiers);

      expect(result.map((e) => e.type).toList(), orderOfModifiers);
    });

    test('should include default order specs', () {
      final modifiers = <WidgetModifierSpec>[
        TransformModifierSpec(transform: Matrix4.rotationX(3)),
        const OpacityModifierSpec(1),
        const AlignModifierSpec(alignment: Alignment.center),
      ];

      final result = orderModifiers([], modifiers);

      expect(result.map((e) => e.type),
          [AlignModifierSpec, TransformModifierSpec, OpacityModifierSpec]);
    });

    test('should handle empty modifiers', () {
      final orderOfModifiers = [TransformModifierSpec];
      final modifiers = <WidgetModifierSpec>[];

      final result = orderModifiers(orderOfModifiers, modifiers);

      expect(result, isEmpty);
    });

    test('should handle duplicate modifiers', () {
      final orderOfModifiers = [TransformModifierSpec];
      final modifiers = [
        const OpacityModifierSpec(1),
        const OpacityModifierSpec(0.4),
      ];

      final result = orderModifiers(orderOfModifiers, modifiers);

      expect(result.length, 1);
      expect(result.first.type, OpacityModifierSpec);
    });
  });
}
