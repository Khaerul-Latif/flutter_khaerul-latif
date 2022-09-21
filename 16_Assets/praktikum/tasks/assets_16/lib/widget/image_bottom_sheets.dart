import 'package:assets_16/pages/full_screen.dart';
import 'package:flutter/material.dart';

class ImageBottomSheets extends StatelessWidget {
  const ImageBottomSheets({Key? key, required this.gambarBottom}) : super(key: key);

  final String gambarBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(30),
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(gambarBottom),
              alignment: Alignment.center,
            ),
          ),
        ),
        TextButton(
          onPressed: (){
            showDialog(
              context: context, 
              builder: (context) => AlertDialog(
                content: const Text('Ingin Tampilkan Layar Penuh?'),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: const Text('No')
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => FullScreen(
                            gambarFull: gambarBottom
                          ),
                        ),
                      );
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ),
            );
          }, 
          child: const Text(
            'Tampilkan Layar Penuh',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16
            ),
          ),
        ),
      ],
    );
  }
}