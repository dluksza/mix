// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class SizedBoxWidgetModifierSpec
    extends WidgetModifierSpec<SizedBoxWidgetModifierSpec> {
  final double? width;
  final double? height;

  const SizedBoxWidgetModifierSpec({this.width, this.height});

  @override
  SizedBoxWidgetModifierSpec lerp(SizedBoxWidgetModifierSpec? other, double t) {
    return SizedBoxWidgetModifierSpec(
      width: lerpDouble(width, other?.width, t),
      height: lerpDouble(height, other?.height, t),
    );
  }

  @override
  SizedBoxWidgetModifierSpec copyWith({double? width, double? height}) {
    return SizedBoxWidgetModifierSpec(
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  get props => [width, height];

  @override
  Widget build(Widget child) {
    return SizedBox(width: width, height: height, child: child);
  }
}

class SizedBoxWidgetModifierAttribute extends WidgetModifierAttribute<
    SizedBoxWidgetModifierAttribute, SizedBoxWidgetModifierSpec> {
  final double? width;
  final double? height;

  const SizedBoxWidgetModifierAttribute({this.width, this.height});

  @override
  SizedBoxWidgetModifierSpec resolve(MixData mix) {
    return SizedBoxWidgetModifierSpec(width: width, height: height);
  }

  @override
  SizedBoxWidgetModifierAttribute merge(
      SizedBoxWidgetModifierAttribute? other) {
    return SizedBoxWidgetModifierAttribute(
      width: other?.width ?? width,
      height: other?.height ?? height,
    );
  }

  @override
  get props => [width, height];
}

class SizedBoxWidgetModifierUtility<T extends Attribute>
    extends MixUtility<T, SizedBoxWidgetModifierAttribute> {
  const SizedBoxWidgetModifierUtility(super.builder);

  T call({double? width, double? height}) {
    return builder(
        SizedBoxWidgetModifierAttribute(width: width, height: height));
  }
}
