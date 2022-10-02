import 'package:flutter/material.dart';
import 'package:project/screens/drawer_screen.dart';
import 'package:project/pages/welcome_page.dart';
import 'package:project/pages/form_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.contain,
              height: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Store.Tif",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      endDrawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WelcomePage(),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Contact us',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Need to get in touch with us? Either fill out the form with your inquiry or find the denartment email youd lke to contact below',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FormPage(
                firstName: firstName,
                lastName: lastName,
                email: email,
                message: message),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'About us',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'Store.Tif',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Text(
                'Toko yang terletak di tebet Jakarta selatan yang menjual berbagai Perlengkapan Alat Olahraga Badminton, pembelian bisa melalui online dan offline. Kami jual produk di E-Commerce dia antaranya Tokopedia, Bukalapak, & Shopee',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'Produk yang di jual',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      children: [
                        Image.network(
                            'https://static.vecteezy.com/system/resources/previews/004/680/255/non_2x/shorts-glyph-icon-free-vector.jpg',
                            height: 200,
                            width: 200),
                        Text(
                          'Short',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      children: [
                        Image.network(
                            'https://cdn-icons-png.flaticon.com/512/44/44255.png',
                            height: 200,
                            width: 200),
                        Text(
                          'Short',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      children: [
                        Image.network(
                            'https://static.vecteezy.com/system/resources/thumbnails/004/680/305/small/shoes-glyph-icon-free-vector.jpg',
                            height: 200,
                            width: 200),
                        Text(
                          'Shoes',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      children: [
                        Image.network(
                            'https://cdn2.iconfinder.com/data/icons/basic-sport/100/badminton_racket_table-tennis_tennis_tennis-racket-512.png',
                            height: 200,
                            width: 200),
                        Text(
                          'Racket Badminton',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
