// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class AlignWidgetModifierSpec
    extends WidgetModifierSpec<AlignWidgetModifierSpec> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignWidgetModifierSpec({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
  });

  @override
  AlignWidgetModifierSpec lerp(AlignWidgetModifierSpec? other, double t) {
    return AlignWidgetModifierSpec(
      alignment: AlignmentGeometry.lerp(alignment, other?.alignment, t),
      widthFactor: lerpDouble(widthFactor, other?.widthFactor, t),
      heightFactor: lerpDouble(heightFactor, other?.heightFactor, t),
    );
  }

  @override
  AlignWidgetModifierSpec copyWith({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return AlignWidgetModifierSpec(
      alignment: alignment ?? this.alignment,
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
    );
  }

  @override
  get props => [alignment, widthFactor, heightFactor];

  @override
  Widget build(Widget child) {
    return Align(
      alignment: alignment ?? Alignment.center,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

class AlignWidgetModifierAttribute extends WidgetModifierAttribute<
    AlignWidgetModifierAttribute, AlignWidgetModifierSpec> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignWidgetModifierAttribute({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
  });

  @override
  AlignWidgetModifierSpec resolve(MixData mix) {
    return AlignWidgetModifierSpec(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  @override
  AlignWidgetModifierAttribute merge(AlignWidgetModifierAttribute? other) {
    return AlignWidgetModifierAttribute(
      alignment: other?.alignment ?? alignment,
      widthFactor: other?.widthFactor ?? widthFactor,
      heightFactor: other?.heightFactor ?? heightFactor,
    );
  }

  @override
  get props => [alignment, widthFactor, heightFactor];
}

class AlignWidgetUtility<T extends Attribute>
    extends MixUtility<T, AlignWidgetModifierAttribute> {
  const AlignWidgetUtility(super.builder);
  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(
      AlignWidgetModifierAttribute(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      ),
    );
  }
}
