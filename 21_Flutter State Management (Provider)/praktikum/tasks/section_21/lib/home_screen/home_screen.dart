import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../create_contact_screen/create_contact_screen.dart';
import '../utils/app_route.dart';
import '../utils/contact_manager.dart';
import 'components/item_contact.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<ContactManager>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer<ContactManager>(
        builder: (context, manager, child) => Stack(
          children: [
            ListView.builder(
              itemCount: manager.listContact.length,
              itemBuilder: (context, index) {
                var contact = manager.listContact[index];
                return ItemContact(contact: contact);
              },
            ),
            manager.listContact.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group),
                        Text('Your contact is empty')
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRoute.to(CreateContactScreen(
            manager: manager,
          ));
        },
        tooltip: 'New Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
