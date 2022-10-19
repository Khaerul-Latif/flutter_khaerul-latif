import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/ItemHomeScreen.dart';
import 'package:section_26/viewmodels/ContactViewModel.dart';
import 'package:section_26/utils/AppRoute.dart';
import 'FormScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<ContactViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer<ContactViewModel>(
        builder: (context, manager, child) => Stack(
          children: [
            ListView.builder(
              itemCount: manager.listContact.length,
              itemBuilder: (context, index) {
                var contact = manager.listContact[index];
                return ItemHomeScreen(contact: contact);
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
          AppRoute.to(FormScreen(
            manager: manager,
          ));
        },
        tooltip: 'New Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
