// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';

import '../core/attributes_map.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import 'align_widget_decorator.dart';
import 'aspect_ratio_widget_decorator.dart';
import 'clip_widget_decorator.dart';
import 'fractionally_sized_box_widget_decorator.dart';
import 'intrinsic_widget_decorator.dart';
import 'opacity_widget_decorator.dart';
import 'sized_box_widget_decorator.dart';
import 'transform_widget_decorator.dart';
import 'visibility_widget_decorator.dart';

// Default order of decorators and their logic:
const _defaultOrder = [
  // 1. VisibilityWidgetModifier: Controls overall visibility. If the widget is set to be invisible,
  // none of the subsequent decorations are processed, providing an early exit and optimizing performance.
  VisibilityWidgetModifierAttribute,

  // 2. SizedBoxWidgetModifier: Explicitly sets the size of the widget before any other transformations are applied.
  // This ensures that the widget occupies a predetermined space, which is crucial for layouts that require exact dimensions.
  SizedBoxWidgetModifierAttribute,

  // 3. FractionallySizedBoxWidgetModifier: Adjusts the widget's size relative to its parent's size,
  // allowing for responsive layouts that scale with the parent widget. This decorator is applied after
  // explicit sizing to refine the widget's dimensions based on available space.
  FractionallySizedBoxWidgetModifierAttribute,

  // 4. AlignWidgetModifier: Aligns the widget within its allocated space, which is especially important
  // for positioning the widget correctly before applying any transformations that could affect its position.
  // Alignment is based on the size constraints established by previous decorators.
  AlignWidgetModifierAttribute,

  // 5. IntrinsicHeightWidgetModifier: Adjusts the widget's height to fit its child's intrinsic height,
  // ensuring that the widget does not force its children to conform to an unnatural height. This is particularly
  // useful for widgets that should size themselves based on content.
  IntrinsicHeightWidgetModifierAttribute,

  // 6. IntrinsicWidthWidgetModifier: Similar to the IntrinsicHeightWidgetModifier, this adjusts the widget's width
  // to its child's intrinsic width. This decorator allows for content-driven width adjustments, making it ideal
  // for widgets that need to wrap their content tightly.
  IntrinsicWidthWidgetModifierAttribute,

  // 7. AspectRatioWidgetModifier: Maintains the widget's aspect ratio after sizing adjustments.
  // This decorator ensures that the widget scales correctly within its given aspect ratio constraints,
  // which is critical for preserving the visual integrity of images and other aspect-sensitive content.
  AspectRatioWidgetModifierAttribute,

  // 9. TransformWidgetModifier: Applies arbitrary transformations, such as rotation, scaling, and translation.
  // Transformations are applied after all sizing and positioning adjustments to modify the widget's appearance
  // and position in more complex ways without altering the logical layout.
  TransformWidgetModifierAttribute,

  // 10. Clip WidgetModifiers: Applies clipping in various shapes to the transformed widget, shaping the final appearance.
  // Clipping is one of the last steps to ensure it is applied to the widget's final size, position, and transformation state.
  ClipOvalWidgetModifierAttribute,
  ClipRRectWidgetModifierAttribute,
  ClipPathWidgetModifierAttribute,
  ClipTriangleWidgetModifierAttribute,
  ClipRectWidgetModifierAttribute,

  // 11. OpacityWidgetModifier: Modifies the widget's opacity as the final decoration step. Applying opacity last ensures
  // that it does not influence the layout or transformations, serving purely as a visual effect to alter the transparency
  // of the widget and its decorations.
  OpacityWidgetModifierAttribute,
];

class RenderWidgetModifiers extends StatelessWidget {
  const RenderWidgetModifiers({
    required this.mix,
    required this.child,
    super.key,
    required this.orderOfWidgetModifiers,
  });

  final MixData mix;
  final Widget child;
  final List<Type> orderOfWidgetModifiers;

  @override
  Widget build(BuildContext context) {
    final specs = resolveWidgetModifierSpecs(orderOfWidgetModifiers, mix);

    var current = child;

    for (final spec in specs) {
      current = spec.build(current);
    }

    return current;
  }
}

class RenderAnimatedWidgetModifiers extends ImplicitlyAnimatedWidget {
  const RenderAnimatedWidgetModifiers({
    required this.mix,
    required this.child,
    required this.orderOfWidgetModifiers,
    super.key,
    required super.duration,
    super.curve = Curves.linear,
    super.onEnd,
  });

  final MixData mix;
  final Widget child;
  final List<Type> orderOfWidgetModifiers;

  @override
  RenderAnimatedWidgetModifiersState createState() =>
      RenderAnimatedWidgetModifiersState();
}

class RenderAnimatedWidgetModifiersState
    extends AnimatedWidgetBaseState<RenderAnimatedWidgetModifiers> {
  final Map<Type, WidgetModifierSpecTween> _specs = {};

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    final specs =
        resolveWidgetModifierSpecs(widget.orderOfWidgetModifiers, widget.mix);

    for (final spec in specs) {
      final specType = spec.runtimeType;
      final previousSpec = _specs[specType];

      _specs[specType] = visitor(
        previousSpec,
        spec,
        (dynamic value) =>
            WidgetModifierSpecTween(begin: value as WidgetModifierSpec),
      ) as WidgetModifierSpecTween;
    }
  }

  @override
  Widget build(BuildContext context) {
    var current = widget.child;

    for (final spec in _specs.keys) {
      final evaluatedSpec = _specs[spec]!.evaluate(animation);
      current = evaluatedSpec.build(current);
    }

    return current;
  }
}

Set<WidgetModifierSpec> resolveWidgetModifierSpecs(
  List<Type> orderOfWidgetModifiers,
  MixData mix,
) {
  final decorators = mix.whereType<WidgetModifierAttribute>();

  if (decorators.isEmpty) return {};
  final decoratorMap =
      AttributeMap<WidgetModifierAttribute>(decorators).toMap();

  final listOfWidgetModifiers = {
    // Prioritize the order of decorators provided by the user.
    ...orderOfWidgetModifiers,
    // Add the default order of decorators.
    ..._defaultOrder,
    // Add any remaining decorators that were not included in the order.
    ...decoratorMap.keys,
  }.toList().reversed;

  final specs = <WidgetModifierSpec>[];

  for (final decoratorType in listOfWidgetModifiers) {
    // Resolve the decorator and add it to the list of specs.
    final decorator = decoratorMap.remove(decoratorType);
    if (decorator == null) continue;
    specs.add(decorator.resolve(mix) as WidgetModifierSpec);
  }

  return specs.toSet();
}

class WidgetModifierSpecTween extends Tween<WidgetModifierSpec> {
  /// Creates an [EdgeInsetsGeometry] tween.
  ///
  /// The [begin] and [end] properties may be null; the null value
  /// is treated as an [WidgetModifierSpec]
  WidgetModifierSpecTween({super.begin, super.end});

  /// Returns the value this variable has at the given animation clock value.
  @override
  WidgetModifierSpec lerp(double t) =>
      WidgetModifierSpec.lerpValue(begin, end, t)!;
}
