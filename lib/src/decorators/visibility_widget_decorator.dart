// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class VisibilityWidgetModifierSpec
    extends WidgetModifierSpec<VisibilityWidgetModifierSpec> {
  final bool visible;
  const VisibilityWidgetModifierSpec(this.visible);

  @override
  VisibilityWidgetModifierSpec lerp(
      VisibilityWidgetModifierSpec? other, double t) {
    return VisibilityWidgetModifierSpec(
      lerpSnap(visible, other?.visible, t) ?? visible,
    );
  }

  @override
  VisibilityWidgetModifierSpec copyWith({bool? visible}) {
    return VisibilityWidgetModifierSpec(visible ?? this.visible);
  }

  @override
  get props => [visible];

  @override
  Widget build(Widget child) {
    return Visibility(visible: visible, child: child);
  }
}

class VisibilityWidgetModifierAttribute extends WidgetModifierAttribute<
    VisibilityWidgetModifierAttribute, VisibilityWidgetModifierSpec> {
  final bool visible;
  const VisibilityWidgetModifierAttribute(this.visible);

  @override
  VisibilityWidgetModifierAttribute merge(
      VisibilityWidgetModifierAttribute? other) {
    return VisibilityWidgetModifierAttribute(other?.visible ?? visible);
  }

  @override
  VisibilityWidgetModifierSpec resolve(MixData mix) {
    return VisibilityWidgetModifierSpec(visible);
  }

  @override
  get props => [visible];
}

class VisibilityUtility<T extends Attribute>
    extends MixUtility<T, VisibilityWidgetModifierAttribute> {
  const VisibilityUtility(super.builder);
  T on() => builder(const VisibilityWidgetModifierAttribute(true));
  T off() => builder(const VisibilityWidgetModifierAttribute(false));

  T call(bool value) => builder(VisibilityWidgetModifierAttribute(value));
}
