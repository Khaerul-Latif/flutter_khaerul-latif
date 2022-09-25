# 32_Weekly Task(Weekly1)
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Project 02
### Project 02 Task 01 Bagian A
**Membuat welcome Page yang berisi gambar dan kata- kata menarik**
```dart
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Image.network(
                  "https://akcdn.detik.net.id/visual/2019/01/15/723621e9-4c3d-4c53-aad2-a9f232007392_169.jpeg?w=650",
                  height: 200,
                  width: double.infinity,
                  fit : BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      SizedBox(height: 150),
                      Text(
                        'Dari Indonesia, Untuk Dunia',
                        style: TextStyle(
                          fontSize: 20,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.black,
                        ),
                      ),
                      Text(
                        'Dari Indonesia, Untuk Dunia',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100, left: 15),
                  child: Text(
                    'Toko yang menjual berbagai Perlengapan Alat Olahraga Badminton',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 15),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Pelajari Lebih Lanjut",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  ),
                ),
              ],
            ),
```

Hasil dari Project 2 task 1 bagian A
![img hasil project2 task 1 bagian A](/32_Weekly%20Task/Weekly1/screenshot/hasil_project2_task1_bagianA.png)

### Project 02 Task 01 Bagian A
```dart
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                children: [
                  TextFormField(
                    controller: firstName,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'First name*',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'can not be empty';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: lastName,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'can not be empty';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: email,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Email*',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'can not be empty';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: message,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'What can we help you with?',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'can not be empty';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Terima Kasih Sudah Mengisi'),
                            content: Text('\nNama : ${firstName.text}'+' '+'${lastName.text}\nEmail : ${email.text}\nMessage : ${message.text}'),
                          ),
                        );
                      },
                      child: Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
```
Hasil dari Project 2 task 2 bagian A
![img hasil project2 task 2 bagian A](/32_Weekly%20Task/Weekly1/screenshot/hasil_project2_task1_bagianA.png)

### Project 02 Task 02 Bagian B 
**Memiliki button submit**
```dart
                  Container(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Terima Kasih Sudah Mengisi'),
                            content: Text('\nNama : ${firstName.text}'+' '+'${lastName.text}\nEmail : ${email.text}\nMessage : ${message.text}'),
                          ),
                        );
                      },
                      child: Text("Submit"),
                    ),
                  ),
```
Hasil dari Project 2 task 2 bagian B
![img hasil project2 task 2 bagian B](/32_Weekly%20Task/Weekly1/screenshot/hasil_project2_task1_bagianA.png)

## Project 02 Task 02 Bagian C
**Membuat fungsi ketika semua form di isi dan ditekan tombol submit keluar alert**
```dart
                  Container(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Terima Kasih Sudah Mengisi'),
                            content: Text('\nNama : ${firstName.text}'+' '+'${lastName.text}\nEmail : ${email.text}\nMessage : ${message.text}'),
                          ),
                        );
                      },
                      child: Text("Submit"),
                    ),
                  ),
```

Hasil dari Project 2 task 2 bagian C
![img hasil project2 task 2 bagian C](/32_Weekly%20Task/Weekly1/screenshot/hasil_project2_task2_bagianC.png)
![img hasil project2 task 2 bagian C](/32_Weekly%20Task/Weekly1/screenshot/project2_task2(c).png)
![img hasil project2 task 2 bagian C](/32_Weekly%20Task/Weekly1/screenshot/project2_task2(c2).png)