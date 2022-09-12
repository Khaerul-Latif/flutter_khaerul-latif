import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_widget_13/drawer_screen.dart';
import 'package:platform_widget_13/message_data.dart';

class TelegramPage extends StatefulWidget {
  @override
  _TelegramPageState createState() => _TelegramPageState();
}

class _TelegramPageState extends State<TelegramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telegram"),
        actions: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search)
          ),
        ],
      ),
      drawer: DrawerScreen(),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final Message message = messageData[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(message.imgProfile),
              ),
              title: Text(
                message.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                message.messageText
              ),
              trailing: Text(
                message.time
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }, itemCount: messageData.length
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create, color: Colors.white),
        backgroundColor: Color(0xFF65A9E0),
        onPressed: () {},
      ),
    );
  }
}