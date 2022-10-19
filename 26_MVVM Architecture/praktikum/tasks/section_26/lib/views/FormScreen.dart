import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_26/utils/AppRoute.dart';
import 'package:section_26/viewmodels/ContactViewModel.dart';
import 'package:section_26/models/ContactModel.dart';
import 'components/ItemNameFormScreen.dart';
import 'components/ItemNoTelpFormScreen.dart';

class FormScreen extends StatefulWidget {
  final ContactViewModel? manager;
  const FormScreen({Key? key, this.manager}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var namedManager =
        ModalRoute.of(context)?.settings.arguments as ContactViewModel?;
    var defaultManager = Provider.of<ContactViewModel>(context, listen: false);
    var manager = (widget.manager ?? namedManager) ?? defaultManager;
    var contact = ContactModel();
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
              NameFormItemScreen((nama) => contact.name = nama),
              const SizedBox(
                height: 15,
              ),
              NoTelpFormItemScreen((noTelp) => contact.noTelp = noTelp),
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
