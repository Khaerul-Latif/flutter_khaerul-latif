import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';
import 'package:uuid/uuid.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.message,
  }) : super(key: key);

  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController message;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  UserModel userModel = UserModel(email: '', lastName: '', firstName: '', message: '');
  late Function(UserModel) tambahUser;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: widget.firstName,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'First name*',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return 'First name tidak boleh kosong';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: widget.lastName,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Last name',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Last name tidak boleh kosong';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: widget.email,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Email*',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email tidak boleh kosong';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: widget.message,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'What can we help you with?',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Message tidak boleh kosong';
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   userModel.firstName = widget.firstName.text;
                //   userModel.lastName = widget.lastName.text;
                //   userModel.email = widget.email.text;
                //   userModel.message = widget.message.text;

                // }
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Terima Kasih Sudah Mengisi'),
                    content: Text('\nNama : ${widget.firstName.text}' +
                        '${widget.lastName.text}\nEmail : ${widget.email.text}\nMessage : ${widget.message.text}'),
                  ),
                );
              },
              child: Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
