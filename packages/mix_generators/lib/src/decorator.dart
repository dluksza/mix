import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class DecoratorGenerator extends GeneratorForAnnotation<Decorator> {
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

    String generatedAttributeClass = generateAttributeClass(visitor);
    buffer.writeln(generatedAttributeClass);

    String generatedUtilityClass = generateUtilityClass(visitor);
    buffer.writeln(generatedUtilityClass);

    return buffer.toString();
  }

  String generateAttributeClass(ModelVisitor visitor) {
    // Class name from model visitor
    String className = visitor.className.replaceFirst('Spec', '');

    // Buffer to write each part of generated class
    final buffer = StringBuffer();

    void generateProperties() {
      for (var key in visitor.constructorFields.keys) {
        String type = visitor.constructorFields[key];
        buffer.writeln(
          'final $type $key;',
        );
      }
    }

    void generateConstructor() {
      buffer.writeln(
        'const ${className}Attribute({',
      );

      buffer.writeln(
        visitor.constructorFields.keys.map((key) => 'this.$key,').join('\n'),
      );

      buffer.writeln('});');
    }

    void generateResolve() {
      buffer.writeln(
        '@override',
      );
      buffer.writeln(
        '${className}Spec resolve(MixData mix) {',
      );

      buffer.writeln(
        'return ${className}Spec(',
      );

      buffer.writeln(
        visitor.constructorFields.keys.map((key) => '$key: $key,').join('\n'),
      );

      buffer.writeln(
        ');',
      );

      buffer.writeln(
        '}',
      );
    }

    void generateMerge() {
      buffer.writeln(
        '@override',
      );
      buffer.writeln(
        '${className}Attribute merge(${className}Attribute? other) {',
      );

      buffer.writeln(
        'return ${className}Attribute(',
      );

      buffer.writeln(
        visitor.constructorFields.keys
            .map((key) => '$key: other?.$key ?? $key,')
            .join('\n'),
      );

      buffer.writeln(
        ');',
      );

      buffer.writeln(
        '}',
      );
    }

    buffer.writeln(
      'class ${className}Attribute extends DecoratorAttribute<${className}Attribute, ${className}Spec> {',
    );

    generateProperties();
    generateConstructor();
    generateResolve();
    generateMerge();

    buffer.writeln('}');
    return buffer.toString();
  }

  String generateUtilityClass(ModelVisitor visitor) {
    // Class name from model visitor
    String className = visitor.className.replaceFirst('Spec', '');

    // Buffer to write each part of generated class
    final buffer = StringBuffer();

    void generateCallMethods() {
      final parameters = visitor.constructorFields.keys
          .map((key) => '${visitor.constructorFields[key]} $key,')
          .join('\n');

      final attributeBody =
          visitor.constructorFields.keys.map((key) => '$key: $key,').join('\n');
      buffer.writeln(
        '''
T call({
  $parameters
}) {
  return builder(
    ${className}Attribute(
      $attributeBody
    ),
  );
}
      ''',
      );
    }

    buffer.writeln(
      'class ${className}Utility<T extends StyleAttribute> extends MixUtility<T, ${className}Attribute> {',
    );

    buffer.writeln(
      'const ${className}Utility(super.builder);',
    );

    generateCallMethods();

    buffer.writeln('}');
    return buffer.toString();
  }
}
