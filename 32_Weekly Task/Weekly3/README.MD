# 32_Weekly Task (Weekly2)
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Project 01
### Project 01 Task 01 Bagian A
**Membuat side bar yang berisi 3 navigation button yaitu contact us,about us, dan login**
```dart
endDrawer: DrawerPage(),
```
diatas membuat atribut endDrawer agar lokasi drawer berada di kanan, serta nilai dari atribut tersebut adalah widget dengan nama "DrawerPage"

```dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top :80),
        child: ListView(
          children: [
            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.addressBook), 
              label: Text("Contact us"), 
            ),
            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.building), 
              label: Text("About us"), 
            ),
            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
             onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.rightToBracket), 
              label: Text("Login"), 
            ),
          ],
        ),
      ),
    );
  }
}
```

diatas menampilkan 3 navigation dan 3 icon contact us, about us, dan login pada drawer

Hasil dari Project 1
![Img Project 1 Task 1](/32_Weekly%20Task/Weekly2/screenshot/project1_task1.png)

### Project 01 Task 02 Bagian A 
**Membuat title bertulis about us**
```dart
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
```

Hasil dari Project 1 Task 2 Bagian A
![Img Project 1 Task 2 Bagian A](/32_Weekly%20Task/Weekly2/screenshot/project1_task2(a).png)

## Project 01 Task 02 Bagian A
**Membuat list produk dalam bentuk card**
```dart
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
```
Hasil dari Project 1 Task 2 Bagian B

![Img Project 1 Task 2 Bagian B](/32_Weekly%20Task/Weekly2/screenshot/project1_task2(b1).png)

![Img Project 1 Task 2 Bagian B](/32_Weekly%20Task/Weekly2/screenshot/project1_task2(b2).png)