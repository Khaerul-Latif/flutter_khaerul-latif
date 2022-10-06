import 'package:flutter/material.dart';

class NameContactItem extends StatefulWidget {
  final Function(String)? name;
  const NameContactItem(this.name, {Key? key}) : super(key: key);

  @override
  State<NameContactItem> createState() => _NameContactItemState();
}

class _NameContactItemState extends State<NameContactItem> {
  final _controllerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controllerName,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        icon: const Icon(Icons.people),
        label: const Text('Name'),
        hintText: 'Name',
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        var name = value ?? '';
        if (name.isEmpty) {
          return 'Add Name Property';
        }
        return null;
      },
      onSaved: (value) {
        var name = value ?? '';
        var nameFunc = widget.name;
        if (name.isNotEmpty && nameFunc != null) {
          nameFunc(name);
        }
      },
    );
  }

  @override
  void dispose() {
    _controllerName.dispose();
    super.dispose();
  }
}
