# (13) Platform Widget
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Summary 
Section 13 ini saya belajar tentang Platform Widget, diantaranya:
1. Scaffold adalah widget utama untuk membuat sebuah halaman pada flutter, scaffold ini memiliki beberapa parameter yang biasa kita gunakan seperti appBar untuk membuat AppBar, body untuk bagian tubuhnya, atau kita juga bisa menambahkan floating action bar, maupun mengganti warna background bodynya.
2. Cupertino Widget adalah Widget untuk membangun Aplikasi yang dibuat oleh IOS
3. CupertinoPageScaffold adalah widget style iOS dari Scaffold

## Task
### Task 01
Membuat tampilan dengan menggunakan flutter MaterialApp
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelegramPage(),
    );
  }
}
```

Berikut ini adalah codingan & outputnya
![imgTask01 & imgTask02](/13_Platform%20Widget/screenshoot/task01_task02.png)

