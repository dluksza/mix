// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_spec.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

base mixin _$ImageSpec on Spec<ImageSpec> {
  static ImageSpec from(MixData mix) {
    return mix.attributeOf<ImageSpecAttribute>()?.resolve(mix) ??
        const ImageSpec();
  }

  /// {@template image_spec_of}
  /// Retrieves the [ImageSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [ImageSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [ImageSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final imageSpec = ImageSpec.of(context);
  /// ```
  /// {@endtemplate}
  static ImageSpec of(BuildContext context) {
    return _$ImageSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [ImageSpec] but with the given fields
  /// replaced with the new values.
  @override
  ImageSpec copyWith({
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    FilterQuality? filterQuality,
    BlendMode? colorBlendMode,
    AnimatedData? animated,
    WidgetModifiersData? modifiers,
  }) {
    return ImageSpec(
      width: width ?? _$this.width,
      height: height ?? _$this.height,
      color: color ?? _$this.color,
      repeat: repeat ?? _$this.repeat,
      fit: fit ?? _$this.fit,
      alignment: alignment ?? _$this.alignment,
      centerSlice: centerSlice ?? _$this.centerSlice,
      filterQuality: filterQuality ?? _$this.filterQuality,
      colorBlendMode: colorBlendMode ?? _$this.colorBlendMode,
      animated: animated ?? _$this.animated,
      modifiers: modifiers ?? _$this.modifiers,
    );
  }

  /// Linearly interpolates between this [ImageSpec] and another [ImageSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [ImageSpec] is returned. When [t] is 1.0, the [other] [ImageSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [ImageSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [ImageSpec] instance.
  ///
  /// The interpolation is performed on each property of the [ImageSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpDouble] for [width] and [height].
  /// - [Color.lerp] for [color].
  /// - [AlignmentGeometry.lerp] for [alignment].
  /// - [Rect.lerp] for [centerSlice].

  /// For [repeat] and [fit] and [filterQuality] and [colorBlendMode] and [animated] and [modifiers], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [ImageSpec] is used. Otherwise, the value
  /// from the [other] [ImageSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [ImageSpec] configurations.
  @override
  ImageSpec lerp(ImageSpec? other, double t) {
    if (other == null) return _$this;

    return ImageSpec(
      width: MixHelpers.lerpDouble(_$this.width, other.width, t),
      height: MixHelpers.lerpDouble(_$this.height, other.height, t),
      color: Color.lerp(_$this.color, other.color, t),
      repeat: t < 0.5 ? _$this.repeat : other.repeat,
      fit: t < 0.5 ? _$this.fit : other.fit,
      alignment: AlignmentGeometry.lerp(_$this.alignment, other.alignment, t),
      centerSlice: Rect.lerp(_$this.centerSlice, other.centerSlice, t),
      filterQuality: t < 0.5 ? _$this.filterQuality : other.filterQuality,
      colorBlendMode: t < 0.5 ? _$this.colorBlendMode : other.colorBlendMode,
      animated: t < 0.5 ? _$this.animated : other.animated,
      modifiers: t < 0.5 ? _$this.modifiers : other.modifiers,
    );
  }

  /// The list of properties that constitute the state of this [ImageSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ImageSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.width,
        _$this.height,
        _$this.color,
        _$this.repeat,
        _$this.fit,
        _$this.alignment,
        _$this.centerSlice,
        _$this.filterQuality,
        _$this.colorBlendMode,
        _$this.animated,
        _$this.modifiers,
      ];

  ImageSpec get _$this => this as ImageSpec;
}

/// Represents the attributes of a [ImageSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ImageSpec].
///
/// Use this class to configure the attributes of a [ImageSpec] and pass it to
/// the [ImageSpec] constructor.
final class ImageSpecAttribute extends SpecAttribute<ImageSpec> {
  final double? width;
  final double? height;
  final ColorDto? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final FilterQuality? filterQuality;
  final BlendMode? colorBlendMode;

  const ImageSpecAttribute({
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
    this.alignment,
    this.centerSlice,
    this.filterQuality,
    this.colorBlendMode,
    super.animated,
    super.modifiers,
  });

  /// Resolves to [ImageSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final imageSpec = ImageSpecAttribute(...).resolve(mix);
  /// ```
  @override
  ImageSpec resolve(MixData mix) {
    return ImageSpec(
      width: width,
      height: height,
      color: color?.resolve(mix),
      repeat: repeat,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      filterQuality: filterQuality,
      colorBlendMode: colorBlendMode,
      animated: animated?.resolve(mix) ?? mix.animation,
      modifiers: modifiers?.resolve(mix),
    );
  }

  /// Merges the properties of this [ImageSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ImageSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ImageSpecAttribute merge(ImageSpecAttribute? other) {
    if (other == null) return this;

    return ImageSpecAttribute(
      width: other.width ?? width,
      height: other.height ?? height,
      color: color?.merge(other.color) ?? other.color,
      repeat: other.repeat ?? repeat,
      fit: other.fit ?? fit,
      alignment: other.alignment ?? alignment,
      centerSlice: other.centerSlice ?? centerSlice,
      filterQuality: other.filterQuality ?? filterQuality,
      colorBlendMode: other.colorBlendMode ?? colorBlendMode,
      animated: animated?.merge(other.animated) ?? other.animated,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
    );
  }

  /// The list of properties that constitute the state of this [ImageSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ImageSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        width,
        height,
        color,
        repeat,
        fit,
        alignment,
        centerSlice,
        filterQuality,
        colorBlendMode,
        animated,
        modifiers,
      ];
}

/// Utility class for configuring [ImageSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [ImageSpecAttribute].
/// Use the methods of this class to configure specific properties of a [ImageSpecAttribute].
base class ImageSpecUtility<T extends Attribute>
    extends SpecUtility<T, ImageSpecAttribute> {
  /// Utility for defining [ImageSpecAttribute.width]
  late final width = DoubleUtility((v) => only(width: v));

  /// Utility for defining [ImageSpecAttribute.height]
  late final height = DoubleUtility((v) => only(height: v));

  /// Utility for defining [ImageSpecAttribute.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [ImageSpecAttribute.repeat]
  late final repeat = ImageRepeatUtility((v) => only(repeat: v));

  /// Utility for defining [ImageSpecAttribute.fit]
  late final fit = BoxFitUtility((v) => only(fit: v));

  /// Utility for defining [ImageSpecAttribute.alignment]
  late final alignment = AlignmentGeometryUtility((v) => only(alignment: v));

  /// Utility for defining [ImageSpecAttribute.centerSlice]
  late final centerSlice = RectUtility((v) => only(centerSlice: v));

  /// Utility for defining [ImageSpecAttribute.filterQuality]
  late final filterQuality =
      FilterQualityUtility((v) => only(filterQuality: v));

  /// Utility for defining [ImageSpecAttribute.colorBlendMode]
  late final colorBlendMode = BlendModeUtility((v) => only(colorBlendMode: v));

  /// Utility for defining [ImageSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  /// Utility for defining [ImageSpecAttribute.modifiers]
  late final modifiers = ModifierUtility((v) => only(modifiers: v));

  ImageSpecUtility(super.builder);

  static final self = ImageSpecUtility((v) => v);

  /// Returns a new [ImageSpecAttribute] with the specified properties.
  @override
  T only({
    double? width,
    double? height,
    ColorDto? color,
    ImageRepeat? repeat,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    FilterQuality? filterQuality,
    BlendMode? colorBlendMode,
    AnimatedDataDto? animated,
    WidgetModifiersDataDto? modifiers,
  }) {
    return builder(ImageSpecAttribute(
      width: width,
      height: height,
      color: color,
      repeat: repeat,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      filterQuality: filterQuality,
      colorBlendMode: colorBlendMode,
      animated: animated,
      modifiers: modifiers,
    ));
  }
}

/// A tween that interpolates between two [ImageSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ImageSpec] specifications.
class ImageSpecTween extends Tween<ImageSpec?> {
  ImageSpecTween({
    super.begin,
    super.end,
  });

  @override
  ImageSpec lerp(double t) {
    if (begin == null && end == null) return const ImageSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
