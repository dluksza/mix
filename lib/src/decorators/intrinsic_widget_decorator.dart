// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class IntrinsicHeightWidgetModifierSpec
    extends WidgetModifierSpec<IntrinsicHeightWidgetModifierSpec> {
  const IntrinsicHeightWidgetModifierSpec();

  @override
  IntrinsicHeightWidgetModifierSpec lerp(
    IntrinsicHeightWidgetModifierSpec? other,
    double t,
  ) {
    // No properties to interpolate, return this instance
    return this;
  }

  @override
  IntrinsicHeightWidgetModifierSpec copyWith() {
    // No properties to copy, return this instance
    return this;
  }

  @override
  List<Object?> get props => []; // No properties

  @override
  Widget build(Widget child) {
    return IntrinsicHeight(child: child);
  }
}

class IntrinsicHeightWidgetModifierAttribute extends WidgetModifierAttribute<
    IntrinsicHeightWidgetModifierAttribute, IntrinsicHeightWidgetModifierSpec> {
  const IntrinsicHeightWidgetModifierAttribute();

  @override
  IntrinsicHeightWidgetModifierAttribute merge(
    IntrinsicHeightWidgetModifierAttribute? other,
  ) {
    // Since there are no properties to merge, return this instance
    return this;
  }

  @override
  IntrinsicHeightWidgetModifierSpec resolve(MixData mix) {
    // Return an instance of IntrinsicHeightSpec
    return const IntrinsicHeightWidgetModifierSpec();
  }

  @override
  List<Object?> get props => []; // No properties to include in props
}

class IntrinsicWidthWidgetModifierSpec
    extends WidgetModifierSpec<IntrinsicWidthWidgetModifierSpec> {
  const IntrinsicWidthWidgetModifierSpec();

  @override
  IntrinsicWidthWidgetModifierSpec lerp(
    IntrinsicWidthWidgetModifierSpec? other,
    double t,
  ) {
    // No properties to interpolate, return this instance
    return this;
  }

  @override
  IntrinsicWidthWidgetModifierSpec copyWith() {
    // No properties to copy, return this instance
    return this;
  }

  @override
  List<Object?> get props => []; // No properties

  @override
  Widget build(Widget child) {
    return IntrinsicWidth(child: child);
  }
}

class IntrinsicWidthWidgetModifierAttribute extends WidgetModifierAttribute<
    IntrinsicWidthWidgetModifierAttribute, IntrinsicWidthWidgetModifierSpec> {
  const IntrinsicWidthWidgetModifierAttribute();

  @override
  IntrinsicWidthWidgetModifierAttribute merge(
    IntrinsicWidthWidgetModifierAttribute? other,
  ) {
    // Since there are no properties to merge, return this instance
    return this;
  }

  @override
  IntrinsicWidthWidgetModifierSpec resolve(MixData mix) {
    // Return an instance of InstrinsicWidthSpec
    return const IntrinsicWidthWidgetModifierSpec();
  }

  @override
  List<Object?> get props => []; // No properties to include in props
}

class IntrinsicHeightWidgetUtility<T extends Attribute>
    extends MixUtility<T, IntrinsicHeightWidgetModifierAttribute> {
  const IntrinsicHeightWidgetUtility(super.builder);
  T call() => builder(const IntrinsicHeightWidgetModifierAttribute());
}

class IntrinsicWidthWidgetUtility<T extends Attribute>
    extends MixUtility<T, IntrinsicWidthWidgetModifierAttribute> {
  const IntrinsicWidthWidgetUtility(super.builder);
  T call() => builder(const IntrinsicWidthWidgetModifierAttribute());
}
