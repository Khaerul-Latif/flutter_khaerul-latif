import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Marcus Santos"),

              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/marcus-santos.jpg"),
              ),
              accountEmail: Text("087391273942"),
          ),
          DrawerListTile(
            iconData: Icons.group,
            title: "New Group",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.contacts,
            title: "Contacts",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.call,
            title: "Calls",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.attribution,
            title: "People Nearby",
            onTilePressed: () {},
          ),
           DrawerListTile(
            iconData: Icons.bookmark_border,
            title: "Save Messages",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.settings,
            title: "Settings",
            onTilePressed: () {},
          ),
          const Divider(),
          DrawerListTile(
            iconData: Icons.person_add,
            title: "Invite Friends",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.help_outline,
            title: "Telegram Features",
            onTilePressed: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile({Key? key, required this.iconData, required this.title, required this.onTilePressed}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(title, style: TextStyle(fontSize: 16)),
    );
  }
}