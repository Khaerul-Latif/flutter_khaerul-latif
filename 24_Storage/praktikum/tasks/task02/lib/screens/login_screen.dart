import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task02/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences logindata;
  late bool newUser;
  late bool _passwordVisible;
  late bool _colorChange;

  @override
  void initState() {
    _passwordVisible = false;
    _colorChange = false;
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter at least 4 characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (email) {
                  if (email != null && !EmailValidator.validate(email)) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: _numberController,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                ),
                validator: (value) {
                  if (value != null && value.length < 12) {
                    return 'Enter at least 12 characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _passwordController,
                obscureText: !_passwordVisible && !_colorChange,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: _colorChange ? Colors.grey : Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                        _colorChange = !_colorChange;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value != null && value.length < 5) {
                    return 'Enter min. 5 characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final isValidForm = formKey.currentState!.validate();
                  String name = _nameController.text;
                  String email = _emailController.text;
                  if (isValidForm) {
                    logindata.setBool('login', false);
                    logindata.setString('name', name);
                    logindata.setString('email', email);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
