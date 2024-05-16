// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

/// A decorator that wraps a widget with the [AspectRatio] widget.
///
/// The [AspectRatio] widget sizes its child to match a given aspect ratio.
class AspectRatioWidgetModifierAttribute extends WidgetModifierAttribute<
    AspectRatioWidgetModifierAttribute, AspectRatioWidgetModifierSpec> {
  /// The aspect ratio to use when sizing the child.
  ///
  /// For example, a 16:9 aspect ratio would have a value of 16.0 / 9.0.
  final double aspectRatio;
  const AspectRatioWidgetModifierAttribute(this.aspectRatio);

  @override
  AspectRatioWidgetModifierAttribute merge(
      AspectRatioWidgetModifierAttribute? other) {
    return AspectRatioWidgetModifierAttribute(
        other?.aspectRatio ?? aspectRatio);
  }

  @override
  AspectRatioWidgetModifierSpec resolve(MixData mix) {
    return AspectRatioWidgetModifierSpec(aspectRatio);
  }

  @override
  get props => [aspectRatio];
}

class AspectRatioWidgetModifierSpec
    extends WidgetModifierSpec<AspectRatioWidgetModifierSpec> {
  final double aspectRatio;
  const AspectRatioWidgetModifierSpec(this.aspectRatio);

  @override
  AspectRatioWidgetModifierSpec lerp(
      AspectRatioWidgetModifierSpec? other, double t) {
    return AspectRatioWidgetModifierSpec(
      lerpDouble(aspectRatio, other?.aspectRatio, t) ?? aspectRatio,
    );
  }

  @override
  AspectRatioWidgetModifierSpec copyWith({double? aspectRatio}) {
    return AspectRatioWidgetModifierSpec(aspectRatio ?? this.aspectRatio);
  }

  @override
  get props => [aspectRatio];

  @override
  Widget build(Widget child) {
    return AspectRatio(aspectRatio: aspectRatio, child: child);
  }
}

class AspectRatioUtility<T extends Attribute>
    extends MixUtility<T, AspectRatioWidgetModifierAttribute> {
  const AspectRatioUtility(super.builder);
  T call(double value) {
    return builder(AspectRatioWidgetModifierAttribute(value));
  }
}
