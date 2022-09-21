import 'package:assets_16/model/data_model.dart';
import 'package:assets_16/widget/image_bottom_sheets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dialog Bottom'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 20,right: 10, left: 10),
        itemCount: gambar.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                context: context,
                builder: (context) =>
                    ImageBottomSheets(gambarBottom: gambar[index]),
              );
            },
            child: Image.network(gambar[index]),
          );
        },
      ),
    );
  }
}
