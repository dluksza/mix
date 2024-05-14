import 'package:flutter/material.dart';

import '../helpers/compare_mixin.dart';
import 'dto.dart';

@immutable
abstract class Attribute with Comparable {
  const Attribute();

  // Used as the key to determine how
  // attributes get merged
  Object get mergeKey => runtimeType;
}

/// Provides the ability to merge this object with another of the same type.
///
/// Defines a single method, [merge], which takes another object of type [T]
/// and returns a new object representing the merged result.
///
/// Typically used by classes like [Dto] or [Attribute] that need to merge
/// instances of the same type.
mixin Mergeable<T> {
  /// Merges this object with [other], returning a new object of type [T].
  T merge(covariant T? other);
}

@immutable
abstract class StyleAttribute extends Attribute {
  const StyleAttribute();

  @override
  Object get mergeKey => runtimeType;
}

/// An abstract class representing a resolvable attribute.
///
/// This class extends the [StyleAttribute] class and provides a generic type [Self] and [Value].
/// The [Self] type represents the concrete implementation of the attribute, while the [Value] type represents the resolvable value.
abstract class SpecAttribute<Value> extends StyleAttribute
    implements Dto<Value> {
  const SpecAttribute();

  @override
  SpecAttribute<Value> merge(covariant SpecAttribute<Value>? other);
}

@immutable
abstract class Spec<T extends Spec<T>> with Comparable {
  const Spec();

  Type get type => T;

  /// Creates a copy of this spec with the given fields
  /// replaced by the non-null parameter values.
  T copyWith();

  /// Linearly interpolate with another [Spec] object.
  T lerp(covariant T? other, double t);
}
