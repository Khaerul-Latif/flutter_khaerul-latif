import 'package:flutter/material.dart';
import 'package:flutter_shop_cart_bloc/models/product.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isAdded;
  final Function() onTap;
  ProductCard({
    super.key,
    required this.product,
    required this.isAdded,
    required this.onTap,
  });
  final currency = NumberFormat("#,##0.00", "id_ID");

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: product.image != null
                  ? Image.network(
                      product.image!,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/default.jpg',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name),
                      Text('Rp ${currency.format(product.price)}'),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    Icons.shopping_cart_rounded,
                    color: isAdded ? Colors.purple : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
