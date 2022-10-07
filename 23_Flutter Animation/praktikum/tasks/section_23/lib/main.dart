import 'package:section_23/task01/anim_screen.dart';
import 'package:section_23/task02/contact_screen/contact_screen.dart';
import 'package:section_23/task02/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task02/bloc/bloc1.dart';
import 'task02/bloc/bloc2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClassBloc(),
        ),
        BlocProvider(
          create: (context) => Favorite(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: AppRoute.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomeScreen(),
      ),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Task01",
            ),
            Tab(
              text: "Task02",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AnimationScreen(),
          MyContactScreen(),
        ],
      ),
    );
  }
}
