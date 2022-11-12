import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/extension/date_time_extension.dart';
import 'package:mini_project/extension/string_extension.dart';
import 'package:mini_project/models/todo_model.dart';
import 'package:mini_project/providers/user_provider.dart';
import 'package:mini_project/screens/list_todo.dart';
import 'package:mini_project/screens/splash_screen.dart';
import 'package:mini_project/services/database_todo.dart';
import 'package:mini_project/screens/form_screen.dart';
import 'package:mini_project/screens/login_screen.dart';
import 'package:mini_project/services/save_user_cache.dart';
import 'package:mini_project/shared/theme.dart';
import 'package:mini_project/shared/transition_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.user, super.key});
  String user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseTodo databaseTodo = DatabaseTodo();

  bool dbIsOpen = false;

  double turns = 0.0;

  @override
  void initState() {
    initDatabase();
    super.initState();
  }

  initDatabase() async {
    bool isOpen = await databaseTodo.initDatabase();
    setState(() {
      dbIsOpen = isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, ${widget.user.caseCamel()}',
                        style: primaryBlackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'have a great day',
                        style: redLightTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            title: Text(
                              'Sign Out',
                              style: primaryBlackTextStyle,
                            ),
                            content: Text(
                              'Are you sure want to sign out the application?',
                              style: primaryBlackTextStyle,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: redLightTextStyle,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: redLight),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    TransitionScreen(
                                      widget: SplashScreen(),
                                      offset: const Offset(-1, 0),
                                    ),
                                  );
                                  // Navigator.pop(context);
                                },
                                child: Text(
                                  'Sign Out',
                                  style: primaryWhiteTextStyle,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.power_settings_new_rounded,
                      color: redLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ongoing Task',
                    style: primaryBlackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        TransitionScreen(
                          widget: ListTodoScreen(
                            user: widget.user,
                          ),
                          offset: const Offset(1, 0),
                        ),
                      );
                    },
                    child: Text(
                      'see all',
                      style: TextStyle(
                        color: redLight,
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: !dbIsOpen
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: greenLight,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Loading database...please wait')
                      ],
                    )
                  : FutureBuilder(
                      future: databaseTodo.fetchAll(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: greenLight,
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Something went wrong.',
                              style: redLightTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                          );
                        } else if (snapshot.connectionState ==
                                ConnectionState.done &&
                            (!snapshot.hasData ||
                                (snapshot.data as List).length == 0)) {
                          return const Center(
                            child: Text('Data Unavailable'),
                          );
                        } else if (snapshot.connectionState ==
                                ConnectionState.done &&
                            snapshot.hasData &&
                            (snapshot.data as List).length > 0) {
                          var todos = snapshot.data as List<Todo>;
                          todos = todos
                              .where((todo) =>
                                  todo.date == DateTime.now().formatSaving())
                              .toList();
                          todos.sort(
                            (a, b) => (Todo.toDateTime(a).compareTo(
                              Todo.toDateTime(b),
                            )),
                          );
                          todos.sort(
                            (a, b) => a.time!
                                .getPeriod()
                                .split('')[0]
                                .toLowerCase()
                                .compareTo(
                                  b.time!
                                      .getPeriod()
                                      .split('')[0]
                                      .toLowerCase(),
                                ),
                          );
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: todos.length,
                            itemBuilder: (context, index) {
                              return buildTaskCard(todos[index]);
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          setState(() => turns += 0.5);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FormScreen(),
            ),
          );
        },
        child: AnimatedRotation(
          turns: turns,
          duration: const Duration(milliseconds: 750),
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }

  Widget circleIconButton(
      {IconData? icon, Color? backgroundColor, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 18,
          color: const Color(0xffF2F0F0),
        ),
      ),
    );
  }

  Widget buildTaskCard(Todo todo) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffFBFBFB),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: -1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Text(
                  todo.title!,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    circleIconButton(
                        icon: Icons.edit_rounded,
                        backgroundColor: greenLight,
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => FormScreen(
                                todo: todo,
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                      width: 8,
                    ),
                    circleIconButton(
                      icon: Icons.delete_rounded,
                      backgroundColor: redLight,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              title: Text(
                                'Remove Task',
                                style: primaryBlackTextStyle,
                              ),
                              content: Text(
                                'Would you like to remove ${todo.title}?',
                                style: primaryBlackTextStyle,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: redLightTextStyle,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      backgroundColor: redLight),
                                  onPressed: () async {
                                    final count =
                                        await databaseTodo.delete(todo.id!);
                                    // Navigator.pop(context);
                                    if (count > 0) {
                                      Navigator.pop(context);
                                    }
                                    // setState(() {});
                                  },
                                  child: Text(
                                    'Remove',
                                    style: primaryWhiteTextStyle,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Text(
                  todo.description!,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(flex: 1, fit: FlexFit.tight, child: Container())
            ],
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 18,
                    color: redLight,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${DateTime.parse(todo.date!).getDateOnly()} | ${todo.time!}',
                    style: redLightTextStyle.copyWith(
                        fontSize: 10, fontWeight: light),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
