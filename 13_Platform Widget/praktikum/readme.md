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
MaterialApp(
      title: 'Telegram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Telegram(),
    );
```

Hasil emulator task 1
- ![imgTask01](/13_Platform%20Widget/screenshoot/task1_drawer_screen.png)
- ![imgTask01](/13_Platform%20Widget/screenshoot/task1_home_page.png)

### Task 02
Membuat tampilan dengan menggunakan flutter CupertinoApp
```dart
CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Edit",
                  style: TextStyle(
                      color: Color.fromARGB(255, 97, 179, 247), fontSize: 16),
                ),
                const Text(
                  "Chats",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CupertinoButton(
                    child: const Icon(CupertinoIcons.square_pencil),
                    onPressed: () {})
              ],
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 5,
              ),
              buildSearchField(),
              const SizedBox(
                height: 5,
              ),
              CupertinoSlidingSegmentedControl<int>(
                  groupValue: groupValue,
                  children: {
                    0: buildSegment("All Chats"),
                    1: buildSegment("Work"),
                    2: buildSegment("Unread"),
                    3: buildSegment("Personal"),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  }),
              const Expanded(child: BottomNav()),
            ],
          ),
        ),
      ),
    );
```
Hasil emulator task 2
- ![imgTask02](/13_Platform%20Widget/screenshoot/task2_contacts_page.png)
- ![imgTask02](/13_Platform%20Widget/screenshoot/task2_calls_page.png)
- ![imgTask02](/13_Platform%20Widget/screenshoot/task2_chats_page.png)
- ![imgTask02](/13_Platform%20Widget/screenshoot/task2_settings_page.png)