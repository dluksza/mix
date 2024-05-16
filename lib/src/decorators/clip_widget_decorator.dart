// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class ClipOvalWidgetModifierSpec
    extends WidgetModifierSpec<ClipOvalWidgetModifierSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalWidgetModifierSpec({this.clipper, this.clipBehavior});

  @override
  ClipOvalWidgetModifierSpec lerp(ClipOvalWidgetModifierSpec? other, double t) {
    return ClipOvalWidgetModifierSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipOvalWidgetModifierSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipOvalWidgetModifierSpec(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipOval(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class ClipOvalWidgetModifierAttribute extends WidgetModifierAttribute<
    ClipOvalWidgetModifierAttribute, ClipOvalWidgetModifierSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalWidgetModifierAttribute({this.clipper, this.clipBehavior});

  @override
  ClipOvalWidgetModifierAttribute merge(
      ClipOvalWidgetModifierAttribute? other) {
    return ClipOvalWidgetModifierAttribute(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipOvalWidgetModifierSpec resolve(MixData mix) {
    return ClipOvalWidgetModifierSpec(
        clipper: clipper, clipBehavior: clipBehavior);
  }

  @override
  get props => [clipper, clipBehavior];
}

class ClipRectWidgetModifierSpec
    extends WidgetModifierSpec<ClipRectWidgetModifierSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectWidgetModifierSpec({this.clipper, this.clipBehavior});

  @override
  ClipRectWidgetModifierSpec lerp(ClipRectWidgetModifierSpec? other, double t) {
    return ClipRectWidgetModifierSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipRectWidgetModifierSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRectWidgetModifierSpec(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipRect(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a [ClipRect] widget.
///
/// The [ClipRect] widget is used to clip a widget to a rectangle.
class ClipRectWidgetModifierAttribute extends WidgetModifierAttribute<
    ClipRectWidgetModifierAttribute, ClipRectWidgetModifierSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectWidgetModifierAttribute({this.clipper, this.clipBehavior});

  @override
  ClipRectWidgetModifierAttribute merge(
      ClipRectWidgetModifierAttribute? other) {
    return ClipRectWidgetModifierAttribute(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipRectWidgetModifierSpec resolve(MixData mix) {
    return ClipRectWidgetModifierSpec(
        clipper: clipper, clipBehavior: clipBehavior);
  }

  @override
  get props => [clipper, clipBehavior];
}

class ClipRRectWidgetModifierSpec
    extends WidgetModifierSpec<ClipRRectWidgetModifierSpec> {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectWidgetModifierSpec({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

  @override
  ClipRRectWidgetModifierSpec lerp(
      ClipRRectWidgetModifierSpec? other, double t) {
    return ClipRRectWidgetModifierSpec(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other?.borderRadius, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipRRectWidgetModifierSpec copyWith({
    BorderRadiusGeometry? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRRectWidgetModifierSpec(
      borderRadius: borderRadius ?? this.borderRadius,
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [borderRadius, clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class ClipRRectWidgetModifierAttribute extends WidgetModifierAttribute<
    ClipRRectWidgetModifierAttribute, ClipRRectWidgetModifierSpec> {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectWidgetModifierAttribute({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

  @override
  ClipRRectWidgetModifierAttribute merge(
      ClipRRectWidgetModifierAttribute? other) {
    return ClipRRectWidgetModifierAttribute(
      borderRadius: other?.borderRadius ?? borderRadius,
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipRRectWidgetModifierSpec resolve(MixData mix) {
    return ClipRRectWidgetModifierSpec(
      borderRadius: borderRadius,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
    );
  }

  @override
  get props => [borderRadius, clipper, clipBehavior];
}

@immutable
class ClipPathWidgetModifierSpec
    extends WidgetModifierSpec<ClipPathWidgetModifierSpec> {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathWidgetModifierSpec({this.clipper, this.clipBehavior});

  @override
  ClipPathWidgetModifierSpec lerp(ClipPathWidgetModifierSpec? other, double t) {
    return ClipPathWidgetModifierSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipPathWidgetModifierSpec copyWith({
    CustomClipper<Path>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipPathWidgetModifierSpec(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a [ClipPath] widget.
///
/// The [ClipPath] widget is used to clip a widget using a custom clipper.
class ClipPathWidgetModifierAttribute extends WidgetModifierAttribute<
    ClipPathWidgetModifierAttribute, ClipPathWidgetModifierSpec> {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathWidgetModifierAttribute({this.clipper, this.clipBehavior});

  @override
  ClipPathWidgetModifierAttribute merge(
      ClipPathWidgetModifierAttribute? other) {
    return ClipPathWidgetModifierAttribute(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipPathWidgetModifierSpec resolve(MixData mix) {
    return ClipPathWidgetModifierSpec(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
    );
  }

  @override
  get props => [clipper, clipBehavior];
}

@immutable
class ClipTriangleWidgetModifierSpec
    extends WidgetModifierSpec<ClipTriangleWidgetModifierSpec> {
  final Clip? clipBehavior;

  const ClipTriangleWidgetModifierSpec({this.clipBehavior});

  @override
  ClipTriangleWidgetModifierSpec lerp(
      ClipTriangleWidgetModifierSpec? other, double t) {
    return ClipTriangleWidgetModifierSpec(
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipTriangleWidgetModifierSpec copyWith({Clip? clipBehavior}) {
    return ClipTriangleWidgetModifierSpec(
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: const TriangleClipper(),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a custom [ClipPath] widget with a [TriangleClipper].
///
/// The [TriangleClipper] is used to clip a widget to a triangle shape.
class ClipTriangleWidgetModifierAttribute extends WidgetModifierAttribute<
    ClipTriangleWidgetModifierAttribute, ClipTriangleWidgetModifierSpec> {
  final Clip? clipBehavior;

  const ClipTriangleWidgetModifierAttribute({this.clipBehavior});

  @override
  ClipTriangleWidgetModifierAttribute merge(
      ClipTriangleWidgetModifierAttribute? other) {
    return ClipTriangleWidgetModifierAttribute(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipTriangleWidgetModifierSpec resolve(MixData mix) {
    return ClipTriangleWidgetModifierSpec(clipBehavior: clipBehavior);
  }

  @override
  get props => [clipBehavior];
}

class TriangleClipper extends CustomClipper<Path> {
  const TriangleClipper();
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

class ClipPathUtility<T extends Attribute>
    extends MixUtility<T, ClipPathWidgetModifierAttribute> {
  const ClipPathUtility(super.builder);

  T call({CustomClipper<Path>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipPathWidgetModifierAttribute(
          clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

class ClipRRectUtility<T extends Attribute>
    extends MixUtility<T, ClipRRectWidgetModifierAttribute> {
  const ClipRRectUtility(super.builder);
  T call({
    BorderRadius? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return builder(
      ClipRRectWidgetModifierAttribute(
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}

class ClipOvalUtility<T extends Attribute>
    extends MixUtility<T, ClipOvalWidgetModifierAttribute> {
  const ClipOvalUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipOvalWidgetModifierAttribute(
          clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

class ClipRectUtility<T extends Attribute>
    extends MixUtility<T, ClipRectWidgetModifierAttribute> {
  const ClipRectUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipRectWidgetModifierAttribute(
          clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

class ClipTriangleUtility<T extends Attribute>
    extends MixUtility<T, ClipTriangleWidgetModifierAttribute> {
  const ClipTriangleUtility(super.builder);
  T call({Clip? clipBehavior}) {
    return builder(
        ClipTriangleWidgetModifierAttribute(clipBehavior: clipBehavior));
  }
}
