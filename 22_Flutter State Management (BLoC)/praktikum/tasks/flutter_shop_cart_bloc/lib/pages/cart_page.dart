import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_cart_bloc/bloc/cart_bloc.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final currency = NumberFormat("#,##0.00", "id_ID");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.items[index].name),
                        subtitle: Text(
                          'Rp ${currency.format(state.items[index].price)}',
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Menghapus Cart'),
                                content: Text(
                                  'Yakin menghapus cart "${state.items[index].name}"?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Batal'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                            DeleteProduct(
                                              state.items[index],
                                            ),
                                          );
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Yakin'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.items.length,
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
              ),
              child: const Text('Buy'),
            )
          ],
        ),
      ),
    );
  }
}
