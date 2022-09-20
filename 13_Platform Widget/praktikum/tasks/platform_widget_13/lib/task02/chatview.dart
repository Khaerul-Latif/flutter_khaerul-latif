import 'package:flutter/material.dart';
import 'chatmodel.dart';
import 'package:flutter/cupertino.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int a = 0;
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          itemsChat.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 55,
                  width: 55,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(itemsChat[index].profile),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemsChat[index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    itemsChat[index].message,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(itemsChat[index].time,
                                    style: const TextStyle(fontSize: 13)),
                                CircleAvatar(
                                  backgroundColor: CupertinoColors.activeBlue,
                                  radius: 8,
                                  child: Text(
                                    "${a++}",
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}