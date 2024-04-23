library generators;

import 'package:build/build.dart';
import 'package:mix_generators/src/mergeable.dart';
import 'package:source_gen/source_gen.dart';

Builder generateJsonMethods(BuilderOptions options) {
  // Step 1
  return SharedPartBuilder(
    [MergeableGenerator()], // Step 2
    'mergeable_generator', // Step 3
  );
}
