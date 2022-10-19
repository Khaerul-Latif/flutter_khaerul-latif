import 'package:flutter/material.dart';

class NoTelpFormItemScreen extends StatefulWidget {
  final Function(String)? noTelp;
  const NoTelpFormItemScreen(this.noTelp, {Key? key}) : super(key: key);

  @override
  State<NoTelpFormItemScreen> createState() => _NoTelpFormItemScreenState();
}

class _NoTelpFormItemScreenState extends State<NoTelpFormItemScreen> {
  final _controllerTelp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controllerTelp,
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          icon: const Icon(Icons.phone),
          label: const Text('No.Telp'),
          hintText: '08xxxxxxx',
          border: const OutlineInputBorder(),),
      validator: (value) {
        var noTelp = value ?? '';
        if (noTelp.isEmpty) {
          return 'Add Phone Number Property';
        }
        return null;
      },
      onSaved: (value) {
        var noTelp = value ?? '';
        var noTelpFunc = widget.noTelp;
        if (noTelp.isNotEmpty && noTelpFunc != null) {
          noTelpFunc(noTelp);
        }
      },
    );
  }

  @override
  void dispose() {
    _controllerTelp.dispose();
    super.dispose();
  }
}
