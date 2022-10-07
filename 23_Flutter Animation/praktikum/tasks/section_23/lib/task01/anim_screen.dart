import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool isBig = false;
  String Image1 =
      'https://users.ece.cmu.edu/~koopman/pjk_wallpaper/1600x1600/nasa_galaxy_wallpaper.jpg';
  String Image2 =
      'https://d.newsweek.com/en/full/1283238/triangulum-galaxy.jpg?w=1600&h=1600&q=88&f=7b5b80a6a1e5e61926124a62b226af6e';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => setState(() {
          isBig = !isBig;
        }),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AnimatedContainer(
                width: isBig ? 0 : 300,
                height: isBig ? 0 : 300,
                duration: const Duration(milliseconds: 1000),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Image.network(
                    Image2,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              AnimatedContainer(
                width: isBig ? 300 : 0,
                height: isBig ? 300 : 0,
                duration: const Duration(milliseconds: 1000),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Image.network(
                    Image1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
