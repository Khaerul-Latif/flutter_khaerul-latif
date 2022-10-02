import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          TextFormField(
            controller: firstName,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'First name*',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'can not be empty';
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: lastName,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Last name',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'can not be empty';
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: email,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Email*',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'can not be empty';
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: message,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'What can we help you with?',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              if (value!.isEmpty) {
                return 'can not be empty';
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
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Terima Kasih Sudah Mengisi'),
                    content: Text('\nNama : ${firstName.text}' +
                        '${lastName.text}\nEmail : ${email.text}\nMessage : ${message.text}'),
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