import 'package:flutter/material.dart';

class WrapperIcons extends StatelessWidget {
  final Icon itemIcons;
  const WrapperIcons(this.itemIcons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: CircleAvatar(
        child: IconButton(
          icon: itemIcons,
          onPressed: () {},
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
