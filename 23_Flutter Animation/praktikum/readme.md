# (23) Flutter Animation
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task
### Task 01
```dart
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool isBig = false;
  String Image1 =
      'https://users.ece.cmu.edu/~koopman/pjk_wallpaper/1600x1600/nasa_galaxy_wallpaper.jpg';
  String Image2 =
      'https://d.newsweek.com/en/full/1283238/triangulum-galaxy.jpg?w=1600&h=1600&q=88&f=7b5b80a6a1e5e61926124a62b226af6e';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => setState(() {
          isBig = !isBig;
        }),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AnimatedContainer(
                width: isBig ? 0 : 300,
                height: isBig ? 0 : 300,
                duration: const Duration(milliseconds: 1000),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Image.network(
                    Image2,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              AnimatedContainer(
                width: isBig ? 300 : 0,
                height: isBig ? 300 : 0,
                duration: const Duration(milliseconds: 1000),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Image.network(
                    Image1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
diatas menampilkan halaman yang sesuai dengan spesifikasi yang diminta, didalam berisi :
- menambahkan 2 variable yang berisi gambar dari internet
- untuk membuat gambar ketika di klik mengecil menggunakan varibel isBig dengan tipe data bool dan menggunakan AnimatedContainer sebagai pembungkusnya serta sebagai Animasinya


Hasil output dan run Task 01

![Gif Task 01](/23_Flutter%20Animation/screenshots/task01.gif)

### Task 02
```dart
class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({required this.exitPage, required this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}
```
diatas membuat class untuk animasi saat perpindah halaman dan saat kembali halaman sebelumnya

```dart
class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Future to(
    Widget exitPage,
    Widget nextPage,
  ) {
    return navigator.push(EnterExitRoute(exitPage: exitPage, enterPage: nextPage));
  }

  static void back<T extends Object?>([
    T? result,
  ]) {
    return navigator.pop(result);
  }
}

```
diatas membuat class untuk route dan mengimport dan mengunakan class animasi dan beberapa parameter yang telah di buat sebelumnya

Hasil output dan run Task 02

![Gif Task 02](/23_Flutter%20Animation/screenshots/task02.gif)