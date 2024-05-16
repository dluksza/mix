// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

/// A decorator that wraps a widget with the [Opacity] widget.
///
/// The [Opacity] widget is used to make a widget partially transparent.
class OpacityWidgetModifierSpec
    extends WidgetModifierSpec<OpacityWidgetModifierSpec> {
  /// The [opacity] argument must not be null and
  /// must be between 0.0 and 1.0 (inclusive).
  final double opacity;
  const OpacityWidgetModifierSpec(this.opacity);

  @override
  OpacityWidgetModifierSpec lerp(OpacityWidgetModifierSpec? other, double t) {
    return OpacityWidgetModifierSpec(
      lerpDouble(opacity, other?.opacity, t) ?? opacity,
    );
  }

  @override
  OpacityWidgetModifierSpec copyWith({double? opacity}) {
    return OpacityWidgetModifierSpec(opacity ?? this.opacity);
  }

  @override
  get props => [opacity];

  @override
  Widget build(Widget child) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'The opacity must be between 0.0 and 1.0 (inclusive).',
    );

    return Opacity(opacity: opacity, child: child);
  }
}

class OpacityWidgetModifierAttribute extends WidgetModifierAttribute<
    OpacityWidgetModifierAttribute, OpacityWidgetModifierSpec> {
  final double opacity;
  const OpacityWidgetModifierAttribute(this.opacity);

  @override
  OpacityWidgetModifierAttribute merge(OpacityWidgetModifierAttribute? other) {
    return OpacityWidgetModifierAttribute(other?.opacity ?? opacity);
  }

  @override
  OpacityWidgetModifierSpec resolve(MixData mix) {
    return OpacityWidgetModifierSpec(opacity);
  }

  @override
  get props => [opacity];
}

class OpacityUtility<T extends Attribute>
    extends MixUtility<T, OpacityWidgetModifierAttribute> {
  const OpacityUtility(super.builder);
  T call(double value) => builder(OpacityWidgetModifierAttribute(value));
}
