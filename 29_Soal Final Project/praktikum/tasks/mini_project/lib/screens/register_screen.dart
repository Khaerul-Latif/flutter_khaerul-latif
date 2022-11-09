import 'package:flutter/material.dart';
import 'package:mini_project/models/user_model.dart';
import 'package:mini_project/providers/user_provider.dart';
import 'package:mini_project/screens/login_screen.dart';
import 'package:mini_project/shared/theme.dart';
import 'package:mini_project/shared/transition_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController goalController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String massage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: primaryColor,
          content: Text(
            massage,
            style: primaryWhiteTextStyle,
          ),
        ),
      );
    }

    void showSucces(String massage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: greenLight,
          content: Text(
            massage,
            style: primaryWhiteTextStyle,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: primaryWhiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: medium,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: primaryWhite,
            size: 30,
          ),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xfff3f4f6),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
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
              buildLabel(name: 'Full Name'),
              const SizedBox(
                height: 6,
              ),
              buildInput(
                controller: nameController,
                hintText: 'Full Name',
                inputType: TextInputType.text,
              ),
              const SizedBox(
                height: 26,
              ),
              buildLabel(name: 'Email'),
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
              buildInput(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
                inputType: TextInputType.visiblePassword,
              ),
              buildLabel(name: 'Goal'),
              const SizedBox(
                height: 6,
              ),
              buildInput(
                controller: goalController,
                hintText: 'Goal',
                inputType: TextInputType.multiline,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
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
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              goalController.text.isEmpty) {
                            showError(
                                'Semua filde tidak boleh kosong');
                          } else {
                            setState(
                              () {
                                isLoading = true;
                              },
                            );

                            UserModel? user = await authProvider.register(
                              emailController.text,
                              passwordController.text,
                              nameController.text,
                              goalController.text,
                            );

                            setState(
                              () {
                                isLoading = false;
                              },
                            );

                            if (user == null) {
                              showError('Akun sudah terdaftar');
                            } else {
                              userProvider.user = user;
                              Navigator.push(
                                context,
                                TransitionScreen(
                                  widget: LoginScreen(),
                                  offset: const Offset(-1, 0),
                                ),
                              );
                              showSucces('Berhasil Registrasi');
                            }
                          }
                        },
                        child: Text(
                          'Register',
                          style: primaryWhiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
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
