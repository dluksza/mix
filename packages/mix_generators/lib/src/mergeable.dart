import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class MergeableGenerator extends GeneratorForAnnotation<Mergeable> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final ModelVisitor visitor = ModelVisitor();
    // Visit class fields and constructor
    element.visitChildren(visitor);

    // Buffer to write each part of generated class
    final buffer = StringBuffer();

    String generatedCopyWith = generateCopyWithMethod(visitor);
    buffer.writeln(generatedCopyWith);

    return buffer.toString();
  }

  String generateCopyWithMethod(ModelVisitor visitor) {
    // Class name from model visitor
    String className = visitor.className;

    // Buffer to write each part of generated class
    final buffer = StringBuffer();

    buffer.writeln(
        "// Extension for a $className class to provide 'merge' method");
    buffer.writeln('extension \$${className}Extension on $className {');
    buffer.writeln('$className merge({');
    buffer.write('$className? other,');

    buffer.writeln('}) {');
    buffer.writeln('return $className(');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln(
        "${visitor.fields.keys.elementAt(i)}: other?.${visitor.fields.keys.elementAt(i)} ?? ${visitor.fields.keys.elementAt(i)},",
      );
    }
    buffer.writeln(');');
    buffer.writeln('}');
    buffer.writeln('}');
    buffer.toString();
    return buffer.toString();
  }
}
