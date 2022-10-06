import 'package:task02/bloc/bloc2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc1.dart';
import '../../utils/app_route.dart';

class Items extends StatefulWidget {
  final Contact contact;
  const Items({Key? key, required this.contact}) : super(key: key);

  @override
  State<Items> createState() => _ItemClassState();
}

class _ItemClassState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    var contact = widget.contact;
    return BlocBuilder<Favorite, ListFavorite>(
      builder: (context, state) {
        return BlocConsumer<Favorite, ListFavorite>(
          listener: (context, state) {},
          builder: (context, state) {
            var isFavorite = state.listFavorite.contains(contact.name);
            return Container(
                            padding: const EdgeInsets.all(8),
              margin:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_rounded,
                  size: 40,
                ),
                title: Text(contact.name),
                trailing: IconButton(
                    onPressed: () => _favorite(state.listFavorite, contact),
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    )),
                subtitle: Text(contact.noTelp),
                onTap: () => _showDialogDelete(context, contact),
              ),
            );
          },
        );
      },
    );
  }

  void _favorite(List<String> list, Contact contact) {
    var isFavorite = list.contains(contact.name);
    context.read<Favorite>().add(isFavorite
        ? RemoveFavContact(contact.name)
        : AddFavContact(contact.name));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isFavorite ? Colors.red : Colors.teal,
      content:
          Text(isFavorite ? 'Removed from favorite.' : 'Added to favorite.'),
      duration: const Duration(seconds: 1),
    ));
  }

  void _showDialogDelete(BuildContext context, Contact contact) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Delete Contact'),
            content: Text('Delete contact "${contact.name}"?'),
            actions: [
              TextButton(
                  onPressed: () => AppRoute.back(),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () => _deleteContact(context, contact),
                  child: const Text('Yes')),
            ],
          ));

  void _deleteContact(BuildContext context, Contact contact) {
    context.read<Favorite>().add(RemoveFavContact(contact.name));
    context.read<ClassBloc>().add(RemoveContact(contact));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text('Deleted Contact ${contact.name}'),
      duration: const Duration(seconds: 1),
    ));
    AppRoute.back();
  }
}
