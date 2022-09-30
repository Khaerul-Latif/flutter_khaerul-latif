import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Faker faker = Faker();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (ctx, index) {
                final String imageUrl = faker.image
                    .image(random: true, keywords: ['emoticons']); //hanya digunakan pada variable itemBuilder

                return InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      Text(faker.lorem.word())
                    ],
                  ),
                  onTap: () {
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10))),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(imageUrl, height: 200, width: 300,),
                              Text(faker.lorem.word()),
                            ],),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(), 
                              child: Text('Oke'),
                            ),
                          ],
                        );
                      }
                    );
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (ctx) {
                    //     return Image.network(imageUrl);
                    //   }
                    // );
                  },
                );
              },
              itemCount: 32,
              padding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }

}