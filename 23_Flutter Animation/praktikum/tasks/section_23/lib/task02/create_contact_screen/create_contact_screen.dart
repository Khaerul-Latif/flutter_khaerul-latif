import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_23/task02/bloc/bloc1.dart';
import '../utils/app_route.dart';
import 'components/name_contact_item.dart';
import 'components/notelp_contact_item.dart';

class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({Key? key}) : super(key: key);

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
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
                        context.read<ClassBloc>().add(AddContact(contact));
                        AppRoute.back();
                      }
                    });
                  },
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
