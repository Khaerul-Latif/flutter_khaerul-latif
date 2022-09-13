# (12) Introduction Flutter Widget
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Summary 
Section 12 ini saya belajar tentang Introduction Flutter Widget, diantaranya:
1. Flutter adalah framework yang di buat oleh google untuk mengembangkan antarmuka pengguna dalam membuat aplikasi mobile,desktop dan web
2. Widget adalah komponen untuk membentuk antarmuka / UI aplikasi, bisa di katakan sebagai blueprint 
3. Built in widget adalah widget yang dapat langsung digunakan / widget bawaan dari flutter itu sendiri

## Task
### Task 01
**Membuat statefull widget yang kontennya dapat berubah tiap detik**
```dart
class _MyAppState extends State { 
  var jam = '';
  void startJam() {
    Timer.periodic(new Duration(seconds: 1), (_) {
      var tgl = new DateTime.now();
      var formatedjam = new DateFormat.Hms().format(tgl);
      setState(() {
        jam = formatedjam;
      });
    });
  }
}  
```

### Task 02
**Memisahkan menjadi beberapa widget tanpa mengubah tampilannya**
```dart
return new MaterialApp(
  home: new Scaffold(
     appBar: new AppBar(
      title: const Text('Flutter Widget'),
    ),
    body: Center(
      child: Text(
        jam,
        style: TextStyle(fontSize: 40),
      ),
    ),
  ),
);
```
Berikut adalah code dan hasil runnya
![imgTask01&Task02](12_Introduction%20Flutter%20Widget/screenshoot/Task01&Task02.png)