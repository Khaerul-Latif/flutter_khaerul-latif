# (19) Dialog Bottom Sheet
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task 
### Task 01
**Membuat Gallery dari beberapa gambar dari internet**
```dart
List<String> gambar = [
    'https://www.kibrispdr.org/data/786/pics-of-spongbob-12.jpg',
    'https://logos-download.com/wp-content/uploads/2016/09/Patrick_Star_picture_logo-520x700.png',
    'https://static.tvtropes.org/pmwiki/pub/images/squidward_tentacles_91.png',
    'https://i.pinimg.com/236x/e1/46/2e/e1462ebce4e7f0c22a2df04275452146.jpg',
    'https://i.pinimg.com/originals/07/4b/d7/074bd7dfc19abf84f5cd6cb70619c703.jpg',
    'https://fbface.files.wordpress.com/2013/01/b5d4a-pearl.jpg',
    'https://static.wikia.nocookie.net/spongebob/images/c/cd/Gary_the_Snail.png/revision/latest/scale-to-width-down/250?cb=20121008231800&path-prefix=id',
    'https://www.pngitem.com/pimgs/m/77-774947_spongebob-fanon-wiki-mrs-puff-spongebob-hd-png.png',
    'https://static.wikia.nocookie.net/spongebob/images/b/ba/Flying_Dutchman.png/revision/latest?cb=20190109144650&path-prefix=id',
    'https://static.wikia.nocookie.net/spongebob/images/c/ca/Mermaid_Man_stock_art.png/revision/latest?cb=20220807020103',
    'https://static.wikia.nocookie.net/spongebob/images/1/18/Karen-blue-form-stock-art.png/revision/latest?cb=20200317150606',
    'https://static.wikia.nocookie.net/spongebob/images/b/b1/Harold_Squarepants_model.png/revision/latest?cb=20220807051128',
    'https://yt3.ggpht.com/M47aFa_OiqIQDj6mkt4N76AsqqABS0tJPXmQ_r2VoC0XfDNLTqwOI5midLRKqER0zXlUMb4hdQ=s900-c-k-c0x00ffffff-no-rj',
    'https://static.wikia.nocookie.net/spongebob/images/d/d5/Barnacle_Boy_stock_art.png/revision/latest/scale-to-width-down/1200?cb=20220807020111',
    'https://static.wikia.nocookie.net/spongebob/images/d/d3/Grandma_SquarePants_model_pose.png/revision/latest/top-crop/width/360/height/450?cb=20220807020833',
    'https://static.wikia.nocookie.net/spongebob/images/b/ba/Bubble_Bass_model.png/revision/latest?cb=20220807054053',
    'https://static.wikia.nocookie.net/spongebob/images/7/71/Princess_Mindy.webp/revision/latest?cb=20220810005336',
    'https://static.wikia.nocookie.net/nickelodeon/images/7/7d/Neptune_with_trident_render.png/revision/latest?cb=20190127020014&path-prefix=id'
];
```
diatas membuat variable gambar dengan tipe list yang berisi gambar dari internet.

```dart
            GridView.builder(
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
```
diatas memcetak list yang sudah dibuat ke dalam gridview.

Hasil dari output dan run Task 01
![Img Task 01](/19_Dialog%20Bottom%20Sheet/screenshoot/task01.png)
### Task 02
**membuat fungsi ketika gambar diklik dapat menampilkan bottom sheet**
```dart
class BottomSheets extends StatelessWidget {
  const BottomSheets({Key? key, required this.gambarBottom})
      : super(key: key);

  final String gambarBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height : 30),
        Text('Gambar Bottom Sheet', style : TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
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
      ],
    );
  }
}

```
diatas membuat widget untuk menampilkan bottom sheet

```dart
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
```
diatas proses saat di klik gambar maka gambar akan muncul di bottom sheet

Hasil dari output dan run Task 02
![Img Task 02](/19_Dialog%20Bottom%20Sheet/screenshoot/task02.png)

### Task 03
**membuat fungsi ketika gambar ditekan dapat menampilkan dialog bottom**

```dart
class AlertDialogs extends StatelessWidget {
  const AlertDialogs({Key? key, required this.gambarAlert}) : super(key: key);

  final String gambarAlert;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Gambar Alert Dialog', style : TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      content: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
        height : 250,
        width : double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(gambarAlert),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
```
diatas membuat widget untuk menampilkan alert dialog

```dart
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialogs(
                    gambarAlert: gambar[index],
                  ),
                );
              },
```
diatas proses saat di tekan gambar maka gambar akan muncul di alert dialog

Hasil dari output dan run Task 03
![Img Task 03](/19_Dialog%20Bottom%20Sheet/screenshoot/task03.png)