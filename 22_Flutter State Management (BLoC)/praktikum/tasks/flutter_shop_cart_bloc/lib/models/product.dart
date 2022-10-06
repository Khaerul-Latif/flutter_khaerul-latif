import 'package:nanoid/non_secure.dart';

class Product {
  late String id;
  String name;
  double price;
  String? image;

  Product({
    required this.name,
    required this.price,
    this.image,
  }) {
    id = nanoid(10);
  }
}
