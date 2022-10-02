import 'package:flutter/material.dart';
import 'package:section_20/models/contacts_model.dart';

class FormClass extends StatefulWidget {
  const FormClass({Key? key}) : super(key: key);

  @override
  State<FormClass> createState() => _FormClassState();
}

class _FormClassState extends State<FormClass> {
  String? nama;
  String? phone;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Create New Contact"), centerTitle: true),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama",
                  icon: const Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  } else {
                    setState(() {
                      nama = value;
                    });
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nomor Telpon",
                  icon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nomor tidak boleh kosong';
                  } else {
                    setState(() {
                      phone = value;
                    });
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    items.add(ContactsModel(name: nama!, phone: phone!));
                    Navigator.pop(context);
                    Navigator.of(context)
                        .pushNamed('/home')
                        .then((value) => setState(() {}));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}