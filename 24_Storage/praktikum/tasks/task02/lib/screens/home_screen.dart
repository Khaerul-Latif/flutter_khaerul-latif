import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task02/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences loginData;
  String name = '';
  String email = '';

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      name = loginData.getString('name') ?? '';
      email = loginData.getString('email') ?? '';
    });
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello, ${name}',
              style:
                  TextStyle(fontSize: 20, color: Color.fromARGB(255, 71, 71, 71)),
            ),
            Text(
              email,
              style:
                  TextStyle(fontSize: 20, color: Color.fromARGB(255, 71, 71, 71)),
            ),
            ElevatedButton(
              onPressed: () {
                loginData.setBool('login', true);
                loginData.remove('name');
                loginData.remove('email');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
