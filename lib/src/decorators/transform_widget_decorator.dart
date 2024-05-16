// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class TransformWidgetModifierSpec
    extends WidgetModifierSpec<TransformWidgetModifierSpec> {
  final Matrix4? transform;
  final Alignment? alignment;

  const TransformWidgetModifierSpec({this.transform, this.alignment});

  @override
  TransformWidgetModifierSpec lerp(
      TransformWidgetModifierSpec? other, double t) {
    return TransformWidgetModifierSpec(
      transform: Matrix4Tween(begin: transform, end: other?.transform).lerp(t),
    );
  }

  @override
  TransformWidgetModifierSpec copyWith({
    Matrix4? transform,
    Alignment? alignment,
  }) {
    return TransformWidgetModifierSpec(
      transform: transform ?? this.transform,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  List<Object?> get props => [transform, alignment];

  @override
  Widget build(Widget child) {
    return Transform(
      transform: transform ?? Matrix4.identity(),
      alignment: alignment ?? Alignment.center,
      child: child,
    );
  }
}

class TransformWidgetModifierAttribute extends WidgetModifierAttribute<
    TransformWidgetModifierAttribute, TransformWidgetModifierSpec> {
  final Matrix4? transform;
  final Alignment? alignment;

  const TransformWidgetModifierAttribute({this.transform, this.alignment});

  @override
  TransformWidgetModifierAttribute merge(
      TransformWidgetModifierAttribute? other) {
    return TransformWidgetModifierAttribute(
      transform:
          other?.transform?.multiplied(transform ?? Matrix4.identity()) ??
              transform,
      alignment: other?.alignment ?? alignment,
    );
  }

  @override
  TransformWidgetModifierSpec resolve(MixData mix) {
    return TransformWidgetModifierSpec(
      transform: transform,
      alignment: alignment,
    );
  }

  @override
  List<Object?> get props => [transform, alignment];
}

class TransformUtility<T extends Attribute>
    extends MixUtility<T, TransformWidgetModifierAttribute> {
  const TransformUtility(super.builder);

  T _flip(bool x, bool y) => builder(
        TransformWidgetModifierAttribute(
          transform: Matrix4.diagonal3Values(
            x ? -1.0 : 1.0,
            y ? -1.0 : 1.0,
            1.0,
          ),
          alignment: Alignment.center,
        ),
      );

  T flipX() => _flip(true, false);
  T flipY() => _flip(false, true);

  T call(Matrix4 value) =>
      builder(TransformWidgetModifierAttribute(transform: value));

  T scale(double value) => builder(
        TransformWidgetModifierAttribute(
          transform: Matrix4.diagonal3Values(value, value, 1.0),
          alignment: Alignment.center,
        ),
      );

  T rotate(double value) => builder(
        TransformWidgetModifierAttribute(
          transform: Matrix4.rotationZ(value),
          alignment: Alignment.center,
        ),
      );
}
