# (15) Flutter Layout
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Summary 
Section 15 ini saya belajar tentang Flutter Layout, diantaranya:
1. Container berguna untuk menambahkan padding, margin, border, background color, atau dekorasi lain ke widget Anda. Banyak layout memanfaatkan container secara bebas untuk memisahkan widget menggunakan padding, atau untuk menambahkan border atau margin. Anda dapat mengubah background perangkat dengan menempatkan seluruh layout Flutter ke dalam container dan mengubah warna atau background image.
2. GridView berguna untuk meletakkan widget sebagai kisi yang dapat digulir. Anda bisa menggunakan GridView untuk meletakkan widget sebagai daftar dua dimensi. GridView menyediakan dua daftar pra-fabrikasi, atau Anda dapat membuat kisi kustom Anda sendiri. Saat GridView mendeteksi bahwa isinya terlalu panjang untuk muat di kotak render, maka secara otomatis akan di-scroll.
3. ListView, Widget ini menampilkan widget sebagai daftar yang dapat digulir. ListView merupakan widget yang mirip seperti kolom, secara otomatis menyediakan pengguliran saat kontennya terlalu panjang untuk kotak rendernya.

## Task
### Task 01
**membuat tampilan menggunakan listview**
```dart
class ListView2 extends StatelessWidget {
  ListView2({Key? key}) : super(key: key);
  final List nama = [
    "Leanne Graham",
    "Ervin Howell",
    "Clementine Bauch",
    "Patricia Lebsack",
    "Chelsey Dietrich",
    "Mrs. Dennis Schulist",
    "Kurtis Weissnat"
  ];

  final List phoneNumber = [
    "1-770-736-8031 x56442",
    "010-692-6593 x09125",
    "1-463-123-4447",
    "493-170-9623 x156",
    "(254)954-1289",
    "1-477-935-8478 x6430",
    "210.067.6132"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON ListView in Flutter"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(nama[index], style: const TextStyle(fontSize: 23)),
              subtitle: Text(phoneNumber[index]),
              leading: CircleAvatar(
                child:
                    Text(nama[index][0], style: const TextStyle(fontSize: 20)),
                backgroundColor: Colors.green,
              ),
            ),
          );
        },
        itemCount: nama.length,
      ),
    );
  }
}

```
**Hasil dari Task 01**
![imgTask01](/15_Flutter%20Layout/screenshoot/task01.png)

### Task 02
**membuat tampilan menggunakan listview**
```dart
class GridViewWidget1 extends StatelessWidget {
  const GridViewWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.pets,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.pregnant_woman,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.spatial_audio_off,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.rounded_corner,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.rowing,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.timeline,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.update,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.access_time_filled,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.back_hand,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.euro,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.g_translate,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.remove_shopping_cart,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.restore_page,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.speaker_notes_off,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.accessibility,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.done_outline,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(child: IconButton(
            icon: const Icon(
              Icons.maximize,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {},
          ), backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.minimize,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.offline_bolt_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.swap_horizontal_circle,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(
                Icons.accessible_forward,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
```
**Hasil dari Task 02**
![imgTask02](/15_Flutter%20Layout/screenshoot/task02.png)