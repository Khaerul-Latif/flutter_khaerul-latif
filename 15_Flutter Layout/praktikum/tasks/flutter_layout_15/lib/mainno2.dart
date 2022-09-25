import 'package:flutter/material.dart';
import 'package:flutter_layout_15/task02/model_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Grid View',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Task02(),
      ),
    );
  }
}

List<IconData> itemColor = [
  Icons.pets,
  Icons.pregnant_woman,
  Icons.spatial_audio_off,
  Icons.rounded_corner,
  Icons.rowing,
  Icons.timeline,
  Icons.update,
  Icons.access_time_filled,
  Icons.back_hand,
  Icons.euro,
  Icons.g_translate,
  Icons.remove_shopping_cart,
  Icons.restore_page,
  Icons.speaker_notes_off,
  Icons.delete_forever,
  Icons.accessibility,
  Icons.check_circle_outline,
  Icons.delete_outline,
  Icons.done_outline,
  Icons.maximize,
  Icons.minimize,
  Icons.offline_bolt_rounded,
  Icons.swap_horizontal_circle,
  Icons.accessible_forward,
];

Widget Task02() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
    ),
    itemBuilder: (context, index) {
      return WrapperIcons(Icon(itemColor[index], size: 30, color : Colors.white));
    },
    itemCount: itemColor.length,
  );
}

// class Task02 extends StatelessWidget {
//   const Task02({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 4,
//       children: <Widget>[
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.pets,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.pregnant_woman,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.spatial_audio_off,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.rounded_corner,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.rowing,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.timeline,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.update,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.access_time_filled,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.back_hand,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.euro,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.g_translate,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.remove_shopping_cart,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.restore_page,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.speaker_notes_off,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.delete_forever,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.accessibility,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.check_circle_outline,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.delete_outline,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.done_outline,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(child: IconButton(
//             icon: const Icon(
//               Icons.maximize,
//               color: Colors.white,
//               size: 30.0,
//             ),
//             onPressed: () {},
//           ), backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.minimize,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.offline_bolt_rounded,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.swap_horizontal_circle,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.all(10),
//           child: CircleAvatar(
//             child: IconButton(
//               icon: const Icon(
//                 Icons.accessible_forward,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               onPressed: () {},
//             ),
//             backgroundColor: Colors.blue,
//           ),
//         ),
//       ],
//     );
//   }
// }