import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../modifiers/render_widget_modifier.dart';
import 'icon_spec.dart';

class StyledIcon extends StyledWidget {
  const StyledIcon(
    this.icon, {
    this.semanticLabel,
    super.style,
    super.key,
    super.inherit = true,
    this.textDirection,
    @Deprecated('Use orderOfModifiers parameter instead')
    List<Type> modifierOrder = const <Type>[],
    List<Type> orderOfModifiers = const <Type>[],
  })  : assert(modifierOrder == const <Type>[] ||
            orderOfModifiers == const <Type>[]),
        super(
          orderOfModifiers:
              orderOfModifiers == const [] ? modifierOrder : orderOfModifiers,
        );

  final IconData? icon;
  final String? semanticLabel;
  // TODO: Should textDirection be a contructor argument or a style attribute?
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (context) {
      final spec = IconSpec.of(context);

      return spec.isAnimated
          ? AnimatedIconSpecWidget(
              icon,
              spec: spec,
              semanticLabel: semanticLabel,
              textDirection: textDirection,
              curve: spec.animated!.curve,
              duration: spec.animated!.duration,
            )
          : IconSpecWidget(
              icon,
              spec: spec,
              semanticLabel: semanticLabel,
              textDirection: textDirection,
            );
    });
  }
}

class IconSpecWidget extends StatelessWidget {
  const IconSpecWidget(
    this.icon, {
    this.spec,
    this.semanticLabel,
    super.key,
    this.textDirection,
    @Deprecated('Use orderOfModifiers parameter instead')
    List<Type> modifierOrder = const <Type>[],
    List<Type> orderOfModifiers = const <Type>[],
  })  : assert(modifierOrder == const <Type>[] ||
            orderOfModifiers == const <Type>[]),
        orderOfModifiers =
            orderOfModifiers == const [] ? modifierOrder : orderOfModifiers;

  final IconData? icon;
  final IconSpec? spec;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final List<Type> orderOfModifiers;

  @override
  Widget build(BuildContext context) {
    return RenderSpecModifiers(
      orderOfModifiers: orderOfModifiers,
      spec: spec ?? const IconSpec(),
      child: Icon(
        icon,
        size: spec?.size,
        fill: spec?.fill,
        weight: spec?.weight,
        grade: spec?.grade,
        opticalSize: spec?.opticalSize,
        color: spec?.color,
        shadows: spec?.shadows,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      ),
    );
  }
}

class AnimatedStyledIcon extends StyledWidget {
  const AnimatedStyledIcon(
    this.icon, {
    this.semanticLabel,
    super.style,
    super.key,
    required this.progress,
    super.inherit,
    this.textDirection,
    @Deprecated('Use orderOfModifiers parameter instead')
    List<Type> modifierOrder = const <Type>[],
    List<Type> orderOfModifiers = const <Type>[],
  })  : assert(modifierOrder == const <Type>[] ||
            orderOfModifiers == const <Type>[]),
        super(
          orderOfModifiers: orderOfModifiers == const <Type>[]
              ? modifierOrder
              : orderOfModifiers,
        );

  final AnimatedIconData icon;
  final String? semanticLabel;
  final Animation<double> progress;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (context) {
      final spec = IconSpec.of(context);

      return AnimatedIcon(
        icon: icon,
        progress: progress,
        color: spec.color,
        size: spec.size,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );
    });
  }
}

class AnimatedIconSpecWidget extends ImplicitlyAnimatedWidget {
  const AnimatedIconSpecWidget(
    this.icon, {
    required this.spec,
    super.key,
    this.semanticLabel,
    this.textDirection,
    super.curve,
    required super.duration,
    super.onEnd,
    @Deprecated('Use orderOfModifiers parameter instead')
    List<Type> modifierOrder = const <Type>[],
    List<Type> orderOfModifiers = const <Type>[],
  })  : assert(modifierOrder == const <Type>[] ||
            orderOfModifiers == const <Type>[]),
        orderOfModifiers = orderOfModifiers == const <Type>[]
            ? modifierOrder
            : orderOfModifiers;

  final IconData? icon;
  final IconSpec spec;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final List<Type> orderOfModifiers;

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedIconSpecState createState() => _AnimatedIconSpecState();
}

class _AnimatedIconSpecState
    extends AnimatedWidgetBaseState<AnimatedIconSpecWidget> {
  IconSpecTween? _spec;

  @override
  // ignore: avoid-dynamic
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _spec = visitor(
      _spec,
      widget.spec,
      // ignore: avoid-dynamic
      (dynamic value) => IconSpecTween(begin: value as IconSpec?),
    ) as IconSpecTween?;
  }

  @override
  Widget build(BuildContext context) {
    final spec = _spec?.evaluate(animation);

    return IconSpecWidget(
      widget.icon,
      spec: spec,
      semanticLabel: widget.semanticLabel,
      textDirection: widget.textDirection,
      orderOfModifiers: widget.orderOfModifiers,
    );
  }
}
