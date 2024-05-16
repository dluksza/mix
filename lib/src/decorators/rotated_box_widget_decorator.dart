// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class RotatedBoxWidgetModifierSpec
    extends WidgetModifierSpec<RotatedBoxWidgetModifierSpec> {
  final int quarterTurns;
  const RotatedBoxWidgetModifierSpec(this.quarterTurns);

  @override
  RotatedBoxWidgetModifierSpec lerp(
      RotatedBoxWidgetModifierSpec? other, double t) {
    // Use lerpInt for interpolating between integers
    return RotatedBoxWidgetModifierSpec(
      lerpInt(quarterTurns, other?.quarterTurns ?? quarterTurns, t),
    );
  }

  @override
  RotatedBoxWidgetModifierSpec copyWith({int? quarterTurns}) {
    return RotatedBoxWidgetModifierSpec(quarterTurns ?? this.quarterTurns);
  }

  @override
  List<Object?> get props => [quarterTurns];

  @override
  Widget build(Widget child) {
    return RotatedBox(quarterTurns: quarterTurns, child: child);
  }
}

class RotatedBoxWidgetModifierAttribute extends WidgetModifierAttribute<
    RotatedBoxWidgetModifierAttribute, RotatedBoxWidgetModifierSpec> {
  final int quarterTurns;
  const RotatedBoxWidgetModifierAttribute(this.quarterTurns);

  @override
  RotatedBoxWidgetModifierAttribute merge(
      RotatedBoxWidgetModifierAttribute? other) {
    // Merge by prioritizing the properties of the other instance if available
    return RotatedBoxWidgetModifierAttribute(
        other?.quarterTurns ?? quarterTurns);
  }

  @override
  RotatedBoxWidgetModifierSpec resolve(MixData mix) =>
      RotatedBoxWidgetModifierSpec(quarterTurns);

  @override
  List<Object?> get props => [quarterTurns];
}

class RotatedBoxWidgetUtility<T extends Attribute>
    extends MixUtility<T, RotatedBoxWidgetModifierAttribute> {
  const RotatedBoxWidgetUtility(super.builder);
  T d90() => builder(const RotatedBoxWidgetModifierAttribute(1));
  T d180() => builder(const RotatedBoxWidgetModifierAttribute(2));
  T d270() => builder(const RotatedBoxWidgetModifierAttribute(3));

  T call(int value) => builder(RotatedBoxWidgetModifierAttribute(value));
}
