// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class FlexibleWidgetModifierSpec
    extends WidgetModifierSpec<FlexibleWidgetModifierSpec> {
  final int? flex;
  final FlexFit? fit;
  const FlexibleWidgetModifierSpec({this.flex, this.fit});

  @override
  FlexibleWidgetModifierSpec lerp(FlexibleWidgetModifierSpec? other, double t) {
    return FlexibleWidgetModifierSpec(
      flex: lerpInt(flex, other?.flex, t),
      fit: lerpSnap(fit, other?.fit, t),
    );
  }

  @override
  FlexibleWidgetModifierSpec copyWith({int? flex, FlexFit? fit}) {
    return FlexibleWidgetModifierSpec(
        flex: flex ?? this.flex, fit: fit ?? this.fit);
  }

  @override
  get props => [flex, fit];

  @override
  Widget build(Widget child) {
    return Flexible(
      flex: flex ?? 1,
      fit: fit ?? FlexFit.loose,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with the [Flexible] widget.
///
/// The [Flexible] widget is used to create a flexible space in a [Row], [Column], or [Flex] widget.
class FlexibleWidgetModifierAttribute extends WidgetModifierAttribute<
    FlexibleWidgetModifierAttribute, FlexibleWidgetModifierSpec> {
  final int? flex;
  final FlexFit? fit;
  const FlexibleWidgetModifierAttribute({this.flex, this.fit});

  @override
  FlexibleWidgetModifierAttribute merge(
      FlexibleWidgetModifierAttribute? other) {
    return FlexibleWidgetModifierAttribute(
      flex: other?.flex ?? flex,
      fit: other?.fit ?? fit,
    );
  }

  @override
  FlexibleWidgetModifierSpec resolve(MixData mix) {
    return FlexibleWidgetModifierSpec(flex: flex, fit: fit);
  }

  @override
  get props => [flex, fit];
}

class FlexibleWidgetModifierUtility<T extends Attribute>
    extends MixUtility<T, FlexibleWidgetModifierAttribute> {
  const FlexibleWidgetModifierUtility(super.builder);
  FlexFitUtility<T> get fit => FlexFitUtility((fit) => call(fit: fit));
  IntUtility<T> get flex => IntUtility((flex) => call(flex: flex));
  T tight({int? flex}) =>
      builder(FlexibleWidgetModifierAttribute(flex: flex, fit: FlexFit.tight));
  T loose({int? flex}) =>
      builder(FlexibleWidgetModifierAttribute(flex: flex, fit: FlexFit.loose));
  T expanded({int? flex}) => tight(flex: flex);

  T call({int? flex, FlexFit? fit}) {
    return builder(FlexibleWidgetModifierAttribute(flex: flex, fit: fit));
  }
}
