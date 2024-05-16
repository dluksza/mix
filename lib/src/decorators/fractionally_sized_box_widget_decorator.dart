// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class FractionallySizedBoxWidgetModifierSpec
    extends WidgetModifierSpec<FractionallySizedBoxWidgetModifierSpec> {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxWidgetModifierSpec({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
  });

  @override
  FractionallySizedBoxWidgetModifierSpec copyWith({
    double? widthFactor,
    double? heightFactor,
    AlignmentGeometry? alignment,
  }) {
    return FractionallySizedBoxWidgetModifierSpec(
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  FractionallySizedBoxWidgetModifierSpec lerp(
    FractionallySizedBoxWidgetModifierSpec? other,
    double t,
  ) {
    return FractionallySizedBoxWidgetModifierSpec(
      widthFactor: lerpDouble(widthFactor, other?.widthFactor, t),
      heightFactor: lerpDouble(heightFactor, other?.heightFactor, t),
      alignment: AlignmentGeometry.lerp(alignment, other?.alignment, t),
    );
  }

  @override
  get props => [widthFactor, heightFactor, alignment];

  @override
  Widget build(Widget child) {
    return FractionallySizedBox(
      alignment: alignment ?? Alignment.center,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

class FractionallySizedBoxWidgetModifierAttribute
    extends WidgetModifierAttribute<FractionallySizedBoxWidgetModifierAttribute,
        FractionallySizedBoxWidgetModifierSpec> {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxWidgetModifierAttribute({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
  });

  @override
  FractionallySizedBoxWidgetModifierAttribute merge(
    FractionallySizedBoxWidgetModifierAttribute? other,
  ) {
    return FractionallySizedBoxWidgetModifierAttribute(
      widthFactor: other?.widthFactor ?? widthFactor,
      heightFactor: other?.heightFactor ?? heightFactor,
      alignment: other?.alignment ?? alignment,
    );
  }

  @override
  FractionallySizedBoxWidgetModifierSpec resolve(MixData mix) {
    return FractionallySizedBoxWidgetModifierSpec(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      alignment: alignment,
    );
  }

  @override
  get props => [widthFactor, heightFactor, alignment];
}

class FractionallySizedBoxWidgetModifierUtility<T extends Attribute>
    extends MixUtility<T, FractionallySizedBoxWidgetModifierAttribute> {
  const FractionallySizedBoxWidgetModifierUtility(super.builder);

  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(
      FractionallySizedBoxWidgetModifierAttribute(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: alignment,
      ),
    );
  }
}
