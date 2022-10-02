import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
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
            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
             onPressed: () {},
              icon: Icon(Icons.person), 
              label: Text("Data User"), 
            ),
          ],
        ),
      ),
    );
  }
}
