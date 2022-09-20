import 'package:flutter/cupertino.dart';
import 'package:platform_widget_13/task02/bottom.dart';
import 'package:platform_widget_13/task01/Telegram.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp2());

// Task 01
class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Telegram(),
    );
  }
}

// Task 02
class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  int? groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Edit",
                  style: TextStyle(
                      color: Color.fromARGB(255, 97, 179, 247), fontSize: 16),
                ),
                const Text(
                  "Chats",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CupertinoButton(
                    child: const Icon(CupertinoIcons.square_pencil),
                    onPressed: () {})
              ],
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 5,
              ),
              buildSearchField(),
              const SizedBox(
                height: 5,
              ),
              CupertinoSlidingSegmentedControl<int>(
                  groupValue: groupValue,
                  children: {
                    0: buildSegment("All Chats"),
                    1: buildSegment("Work"),
                    2: buildSegment("Unread"),
                    3: buildSegment("Personal"),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      groupValue = value;
                    },
                    );
                  },
                  ),
              const Expanded(child: BottomNav()),
            ],
          ),
        ),
      ),
    );
  }
}

buildSearchField() {
  return Center(
    child : CupertinoSearchTextField(
    placeholder: 'Search',
    prefixIcon: Icon(CupertinoIcons.search),
   ),
  );
}

buildSegment(String text) {
  return Text(text,
      style: const TextStyle(fontSize: 14, color: CupertinoColors.systemBlue));
}