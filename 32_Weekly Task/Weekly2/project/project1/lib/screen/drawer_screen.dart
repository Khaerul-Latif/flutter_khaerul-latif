import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top :80),
        child: ListView(
          children: [
            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.addressBook), 
              label: Text("Contact us"), 
            ),
            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.building), 
              label: Text("About us"), 
            ),
            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
             onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.rightToBracket), 
              label: Text("Login"), 
            ),
          ],
        ),
      ),
    );
  }
}
