import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ClassVisitor extends SimpleElementVisitor<void> {
  final fields = <String, FieldElement>{};

  @override
  void visitFieldElement(FieldElement element) {
    // final elementType = element.type.toString();
    fields[element.name] = element;
  }
}