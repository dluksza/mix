import 'package:mix_annotations/mix_annotations.dart';

@mergeable
class Product {
  final String name;
  final double price;

  const Product({required this.name, required this.price});
}
