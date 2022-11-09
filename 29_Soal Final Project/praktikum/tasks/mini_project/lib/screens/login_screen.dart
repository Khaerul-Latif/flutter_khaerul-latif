import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/models/user_model.dart';
import 'package:mini_project/providers/auth_provider.dart';
import 'package:mini_project/providers/user_provider.dart';
import 'package:mini_project/screens/home_screen.dart';
import 'package:mini_project/screens/register_screen.dart';
import 'package:mini_project/services/save_user_cache.dart';
import 'package:mini_project/shared/theme.dart';
import 'package:mini_project/shared/transition_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    bool isValid = true;

    void showError(String massage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: redLight,
          content: Text(massage, style: primaryWhiteTextStyle),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xfff3f4f6),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 64,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/register_login.png',
                  width: 245,
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              buildLabel(name: 'Email Address'),
              const SizedBox(
                height: 6,
              ),
              const SizedBox(
                height: 6,
              ),
              buildInput(
                controller: emailController,
                hintText: 'Email',
                inputType: TextInputType.text,
              ),
              const SizedBox(
                height: 26,
              ),
              buildLabel(name: 'Password'),
              const SizedBox(
                height: 6,
              ),
              const SizedBox(
                height: 6,
              ),
              buildInput(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
                inputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 360,
                height: 55,
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: greenLight,
                        ),
                      )
                    : TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            showError('Semua filde tidak boleh kosong');
                          } else {
                            setState(
                              () {
                                isLoading = true;
                              },
                            );
                            UserModel? user = await authProvider.login(
                              emailController.text,
                              passwordController.text,
                            );

                            setState(() {
                              isLoading = false;
                            });

                            if (user == null) {
                              showError('Email atau password salah');
                            } else {
                              userProvider.user = user;
                              save(userProvider.user.name!);
                            }
                          }
                        },
                        child: Text(
                          'Login',
                          style: primaryWhiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 360,
                height: 55,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0x0ffcfcfc),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: primaryColor.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      TransitionScreen(
                        widget: RegisterScreen(),
                        offset: Offset(1, 0),
                      ),
                    );
                  },
                  child: Text(
                    'Create New Account',
                    style: primaryTextStyle.copyWith(
                      color: primaryColor.withOpacity(0.5),
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  save(String username) async {
    if (username.isEmpty) {
      setState(() {
        isValid = false;
      });
      return;
    }
    // var userProvider = Provider.of<UserProvider>(context);
    bool isSaved = await SaveUserCache.saveUser(username);
    if (isSaved) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HomeScreen(
            user: username,
          ),
        ),
      );
    }
  }

  Text buildLabel({String? name}) {
    return Text(
      name!,
      style: primaryTextStyle.copyWith(
        fontSize: 14,
        fontWeight: semiBold,
      ),
    );
  }

  Container buildInput(
      {double? height = 50,
      TextInputType? inputType,
      bool readOnly = false,
      TextEditingController? controller,
      String? hintText,
      bool obsecureText = false}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffEDEDED),
        ),
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        obscureText: obsecureText,
        style: redLightTextStyle.copyWith(
          fontSize: 20,
          fontWeight: light,
        ),
        readOnly: readOnly,
        keyboardType: inputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: redLightTextStyle.copyWith(
            color: redLight.withOpacity(0.5),
            fontSize: 14,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
