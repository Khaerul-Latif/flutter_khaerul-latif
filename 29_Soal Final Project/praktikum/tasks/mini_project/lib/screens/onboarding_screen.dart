import 'package:mini_project/models/onboarding_model.dart';
import 'package:mini_project/screens/login_screen.dart';
import 'package:mini_project/shared/theme.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState(false);
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  _OnBoardingScreenState(this.revere);

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  final bool revere;
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onBoards.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 50, right: 20, left: 20, bottom: 10),
                      child: Column(
                        children: [
                          Image.asset(onBoards[index].image),
                          SizedBox(height: 20),
                          Text(
                            onBoards[index].title,
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            onBoards[index].description,
                            style: redLightTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoards.length,
                  (index) => buildPage(index, context),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.all(40),
              child: MaterialButton(
                onPressed: () async {
                  if (currentIndex == onBoards.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  }
                  _controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                color: primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  currentIndex == onBoards.length - 1 ? "GET STARTED" : "NEXT",
                  style: primaryWhiteTextStyle.copyWith(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPage(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? redLight : redDark.withOpacity(0.4),
      ),
    );
  }
}
