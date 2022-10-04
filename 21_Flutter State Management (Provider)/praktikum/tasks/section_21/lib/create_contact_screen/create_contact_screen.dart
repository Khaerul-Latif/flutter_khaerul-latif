import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/contact.dart';
import '../utils/app_route.dart';
import '../utils/contact_manager.dart';
import 'components/name_contact_item.dart';
import 'components/notelp_contact_item.dart';

class CreateContactScreen extends StatefulWidget {
  final ContactManager? manager;
  const CreateContactScreen({Key? key, this.manager}) : super(key: key);

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var namedManager =
        ModalRoute.of(context)?.settings.arguments as ContactManager?;
    var defaultManager = Provider.of<ContactManager>(context, listen: false);
    var manager = (widget.manager ?? namedManager) ?? defaultManager;
    var contact = Contact();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              NameContactItem((nama) => contact.name = nama),
              const SizedBox(
                height: 15,
              ),
              NoTelpContactItem((noTelp) => contact.noTelp = noTelp),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenSize.width,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        manager.addContact(contact);
                        AppRoute.back();
                      }
                    });
                  },
                  child: const Text('CREATE CONTACT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
