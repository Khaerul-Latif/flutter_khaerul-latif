# 32_Weekly Task(Weekly1)
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Project 01
### Project 01 Task 01 Bagian A
**Membuat folder project berisi kode - kode**

![Img Project 1 A](/32_Weekly%20Task/Weekly1/screenshot/project1_task1(a).png)

### Project 01 Task 01 Bagian B 
**Membuat folder screenshot berisi hasil kode yang telah dibuat**

![Img Project 1 B](/32_Weekly%20Task/Weekly1/screenshot/project1_task1(b).png)

## Project 01 Task 02 Bagian A
**Membuah Appbar pada Aplikasi dengan text atau logo**
```dart
    AppBar(
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
            Text("Store.Tif", style: TextStyle(color: Colors.black)),
          ],
        ),
        backgroundColor: Colors.white,
      ),
```
Hasil dari project 1
![img hasil project1](/32_Weekly%20Task/Weekly1/screenshot/hasil_project1_task1_bagianA.png)