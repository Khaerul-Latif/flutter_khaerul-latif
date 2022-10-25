# (28) UI Testing
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task
### Task 01
1. Lakukan test seluruh halaman yang pernah dibuat pada bagian judul, body, dan seluruh elemen yang ada pada halaman tersebut!

```dart
class Contact {
  String name;
  String number;

  Contact(this.name, this.number);
}

// ignore: camel_case_types
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Contact> contact = [
    Contact('Yanto', '098320132132'),
    Contact('Jamil', '0887321848342'),
    Contact('Aceng', '0883174892743'),
    Contact('Arwin', '083218431204'),
    Contact('Maul', '08391283012828'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Home Screen Contact"),
          ),
          floatingActionButton: SizedBox(
            height: 60,
            width: 60,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                      return const FormScreen();
                    }, transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                      final tween = Tween(begin: 0.0, end: 2.0);
                      return FadeTransition(
                          opacity: animation.drive(tween), child: child);
                    }),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final user = contact[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(user.name[0]),
                ),
                onTap: () {},
                title: Text(
                  user.name,
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  user.number,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
            itemCount: contact.length,
          ),
        ),
      ),
    );
  }
}
```
diatas membuat home screen

```dart
void main() {
  testWidgets('testing pada home screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('home screen'),
          ),
        ),
      ),
    ));
    expect(find.text('home screen'), findsOneWidget);
  });
  testWidgets('Icon untuk menambah kontak', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    ));
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
  testWidgets('Melakukan test pada semua elemen', (WidgetTester tester) async {
    tester.allElements;
  });
}
```
diatas mengetest judul, body dan seluru element pada home screen

```dart
class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var inputController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          key: const ValueKey("create contacts"),
          appBar: AppBar(
            title: const Text("Create New Contacts"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Padding(
            key: const ValueKey("test create"),
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                      hintText: 'Type Contact Name Here...',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                      hintText: 'Type Contact Phone Number Here...',
                      labelText: 'Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                  ) 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
diatas membuat form screen

```dart
void main() {
  testWidgets('testing pada form screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('create new contact'),
          ),
        ),
      ),
    ));

    expect(find.text('create new contact'), findsOneWidget);
  });
  testWidgets('melakukan test pada semua element', (WidgetTester tester) async {
    tester.allElements;
  });
}
```
diatas mengetest judul, body dan seluru element pada form screen

Hasil dari Task 01

![video task01](/28_UI%20Testing/screenshots/task_01.mp4)

### Task 02
2. Lakukan test pada halaman yang belum dibuat!.

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
      child: Scaffold(
        body: null,  
      )),
    );
  }
}
```
diatas membuat halaman yang kosong 

```dart
void main() {
  testWidgets('melakukan test pada halaman kosong', (tester) async {});
}
```
diatas mengetest halaman kosong yang sudah dibuat

Hasil dari Task 02
![gif task02](/28_UI%20Testing/screenshots/task_02.gif)