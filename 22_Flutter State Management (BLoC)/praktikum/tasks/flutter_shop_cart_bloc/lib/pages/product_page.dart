import 'package:flutter/material.dart';
import 'package:flutter_shop_cart_bloc/pages/cart_page.dart';
import 'package:flutter_shop_cart_bloc/widgets/product_list.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta Shop'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
        ],
      ),
      body: const ProductList(),
    );
  }
}
