# (16) Assets
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task
### Task 01
**Membuat gridview berupa 6 gambar gambar dari internet**
```dart
List<String> gambar = [
    'https://www.kibrispdr.org/data/786/pics-of-spongbob-12.jpg',
    'https://logos-download.com/wp-content/uploads/2016/09/Patrick_Star_picture_logo-520x700.png',
    'https://static.tvtropes.org/pmwiki/pub/images/squidward_tentacles_91.png',
    'https://i.pinimg.com/236x/e1/46/2e/e1462ebce4e7f0c22a2df04275452146.jpg',
    'https://i.pinimg.com/originals/07/4b/d7/074bd7dfc19abf84f5cd6cb70619c703.jpg',
    'https://fbface.files.wordpress.com/2013/01/b5d4a-pearl.jpg',
];
```
diatas proses membuat list untuk menyimpan url gambar dari internet

```dart
    Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(gambarBottom),
              alignment: Alignment.center,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text('Ingin Tampilkan Layar Penuh?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No')),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullScreen(gambarFull: gambarBottom),
                        ),
                      );
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ),
            );
          },
          child: const Text(
            'Tampilkan Layar Penuh',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ],
    );
```
diatas proses menampilkan gridview dari list yang sudah dibuat

**Hasil Output Task01**
![imgTask01](/16_Assets/screenshoot/task01.png)

### Task 02 A
```dart
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
                  builder: (context) => ImageBottomSheets(
                    gambarBottom: gambar[index],
                  ),
                );
              },
              child: Image.network(
                gambar[index],
              ),
            );
          },
```
diatas menampilkan jika saat salah satu gambar pada homepage di klik

**Hasil Output Task02 A**
![imgTask02](/16_Assets/screenshoot/task02(1).png)

### Task 02 B
```dart
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(gambarBottom),
              alignment: Alignment.center,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text('Ingin Tampilkan Layar Penuh?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No')),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullScreen(gambarFull: gambarBottom),
                        ),
                      );
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ),
            );
          },
          child: const Text(
            'Tampilkan Layar Penuh',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ],
    );
```
diatas adalah proses untuk memampilkan gambar full dengan mengklik tulisan 'Tampilkan Layat Penuh'

**Hasil Output Task02 B**
![imgTask02](/16_Assets/screenshoot/task02(2).png)

## Task 02 C
```dart
    return Scaffold(
      appBar: AppBar(
        title: Text('Gambar Full'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(gambarFull), fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
```

diatas untuk menampilkan gamabr full jika gambat sebelumnya di klik Yes'
**Hasil Output Task02 B**
![imgTask02](/16_Assets/screenshoot/task02(3).png
### Latihan 01
**Membuat background image dan menampilkan image dari internet, serta menampilkan nama di tebalkan tuliskannya**
```dart
Widget HomePage() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          "https://wallpapercave.com/wp/wp9392330.jpg",
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToXA4znlFUMBw1Ziu6JVUwWEWxukwGAtuKcw&usqp=CAU",
                height: 500,
                width: 500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 250),
            child: Center(
              child: Text("Khaerul Latif",
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    ),
  );
}
```
Diatas proses menampilkan background image dan menampilkan image dari internet, serta menampilkan nama di tebalkan