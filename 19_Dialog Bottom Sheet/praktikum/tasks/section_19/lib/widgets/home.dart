import 'package:flutter/material.dart';
import 'package:section_19/models/data_model.dart';
import 'bottom_sheets.dart';
import 'alert_dialog.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dialog Bottom'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          padding: EdgeInsets.only(top: 20, right: 10, left: 10),
          itemCount: gambar.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) => BottomSheets(
                    gambarBottom: gambar[index],
                  ),
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialogs(
                    gambarAlert: gambar[index],
                  ),
                );
              },
              child: Image.network(
                gambar[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
