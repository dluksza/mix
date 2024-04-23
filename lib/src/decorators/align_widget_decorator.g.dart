// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'align_widget_decorator.dart';

// **************************************************************************
// DecoratorGenerator
// **************************************************************************

class AlignDecoratorAttribute
    extends DecoratorAttribute<AlignDecoratorAttribute, AlignDecoratorSpec> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;
  const AlignDecoratorAttribute({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
  });
  @override
  AlignDecoratorSpec resolve(MixData mix) {
    return AlignDecoratorSpec(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  @override
  AlignDecoratorAttribute merge(AlignDecoratorAttribute? other) {
    return AlignDecoratorAttribute(
      alignment: other?.alignment ?? alignment,
      widthFactor: other?.widthFactor ?? widthFactor,
      heightFactor: other?.heightFactor ?? heightFactor,
    );
  }
}

class AlignDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, AlignDecoratorAttribute> {
  const AlignDecoratorUtility(super.builder);
  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(
      AlignDecoratorAttribute(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      ),
    );
  }
}
