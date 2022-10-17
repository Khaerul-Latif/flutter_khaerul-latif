# (25) Introduction REST API - JSON serialization/deserialization
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task
### Task 01
#### Buatlah sebuah halaman yang terdiri dari 4 tombol, 2 kolom teks (Textfield), dan satu text untuk menampilkan hasil request dari API, dengan detail sebagai berikut:
**Buatlah 2 kolom teks (Textfield untuk input data name & job**
```dart
            TextFormField(
                controller: namecntrlr,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: jobcntrlr,
                decoration: InputDecoration(
                  labelText: 'Job',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
```

**Tombol 1: gunakan tombol per ama untuk melakukan GET request menggunakan Dio, untuk request ke url: https://reqres.in/api/users. Tampilkan hasil responsenya ke dalam text**
```dart
class UserCreate {
  String? id;
  String name;
  String job;
  String? createdAt;

  UserCreate({
    this.id,
    required this.name,
    required this.job,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'job': job};
  }

  factory UserCreate.fromJson(Map<String, dynamic> data) {
    final timestamp = data['createdAt'];
    final dateFormat = DateFormat('yyyy-mm-ddThh:mm:ss');
    final convertToDateTime = dateFormat.parse(timestamp);
    final result = DateFormat.yMd().add_jm().format(convertToDateTime);
    return UserCreate(
      id: data['id'],
      name: data['name'],
      job: data['job'],
      createdAt: result,
    );
  }

  @override
  String toString() {
    return 'User={id=$id, name=$name, job=$job, createdAt=$createdAt}';
  }
}
```
diatas membuat model userCreate yang berisi beberapa variabel dan method

```dart
  Future<Iterable<UserModel>> fetchUser() async {
    try {
      var response = await dio.get('https://reqres.in/api/users');
      if (response.statusCode != 200) {
        throw Exception('Fetch data users failed');
      }
      var data = response.data['data'] as List;
      var users = data.map((e) => UserModel.fromJson(e));
      return users;
    } catch (error) {
      rethrow;
    }
  }
```
diatas membuat fungsi untuk melakukan GET request

```dart
                  ElevatedButton(
                    onPressed: () async {
                      final user = await apiService.fetchUser();
                      req = 'GET';
                      users = user.toList();
                    },
                    child: const Text('GET'),
                  ),
```
diatas membuat tombol aksi untuk menampilkan fungsi GET request yang sudah dibuat sebelumnya, dan namakan dengan string **GET**


```dart
    switch (req) {
      case 'GET':
        return ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            final user = users[index];
            return ListTile(
              title: Text('${user.firstName} ${user.lastName}'),
              subtitle: Text(user.email),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
              ),
            );
          },
          itemCount: users.length,
        );
    }
```
diatas membuat switch case statement jika req stringnya **GET** akan menampilkan listview dari fungsi GET request yang sudah dibuat sebelumnya

**Tombol 2: gunakan tombol kedua untuk melakukan POST request menggunakan Dio, untuk request ke url: https://reqres.in(api/users. Data request yang digunakan untuk url ini adalah dengan sebuah Map, dengan key berupa name & Job. Gunakan data dari Texfield sebagai value untuk data request. Tampilkan hasil res onsen a ke dalam text**
```dart
  Future<UserCreate> createUser(UserCreate user) async {
    try {
      var response = await dio.post(
        'https://reqres.in/api/users',
        data: user.toMap(),
      );
      var userFromResponse = UserCreate.fromJson(response.data);
      return userFromResponse;
    } catch (e) {
      rethrow;
    }
  }
```
diatas membuat fungsi untuk melakukan Post request

```dart
class PlaceHolderUser extends StatelessWidget {
  final String name;
  final String job;
  final String dateNow;
  final String dateTitle;

  const PlaceHolderUser(
      {super.key,
      required this.name,
      required this.job,
      required this.dateNow,
      required this.dateTitle});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Name : $name',
            style: const TextStyle(
              fontWeight : FontWeight.bold,
            ),
          ),
          Text(
            'Job : $job',
            style: const TextStyle(
              fontWeight : FontWeight.bold,
            ),
          ),
          Text(
            '$dateTitle : $dateNow',
            style: const TextStyle(
              fontWeight : FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
```
diatas membuat class model dengan turunan statelesswidget yang berisi column

```dart
  Widget hasilPost() {
    if (userCreate != null) {
      return PlaceHolderUser(
          name: userCreate!.name,
          job: userCreate!.job,
          dateNow: userCreate!.createdAt!,
          dateTitle: 'Date Time Post');
    }

    return const SizedBox();
  }
```
diatas membuat widget untuk menampilkan class model yang sudah dibuat

```dart
                  ElevatedButton(
                    onPressed: () async {
                      final userModel = UserCreate(
                        name: namecntrlr.text,
                        job: jobcntrlr.text,
                      );
                      final user = await apiService.createUser(userModel);
                      userCreate = user;
                      req = 'POST';
                    },
                    child: const Text('POST'),
                  ),
```

diatas membuat tombol aksi untuk menampilkan fungsi POST request yang sudah dibuat sebelumnya, dan namakan dengan string **POST**

```dart
 case 'POST':
        return Center(child: hasilPost());
```
diatas membuat switch case statement jika req stringnya **POST** akan menampilkan widget hasilPost();

**Tombol 3: gunakan tombol ketiqa untuk melakukan PUT request menggunakan Dio, untuk request ke url: https:7/reqres.in/api/users/4. Data request yang digunakan untuk url ini adalah denqan sebuah Map, dengan key berupa name & job. Gunakan data dari Textfield sebagai value untuk data request. Tampilkan hasil res onsen a ke dalam text**
```dart
  Future<UserUpdate?> updateUser(UserUpdate user) async {
    try {
      var response = await dio.put(
        'https://reqres.in/api/users/4',
        data: user.toMap(),
      );
      var userFromResponse = UserUpdate.fromJson(response.data);
      return userFromResponse;
    } catch (e) {
      rethrow;
    }
  }
```
diatas membuat fungsi untuk melakukan PUT request

```dart

  Widget hasilPut() {
    if (userUpdate != null) {
      return PlaceHolderUser(
        name: userUpdate!.name,
        job: userUpdate!.job,
        dateNow: userUpdate!.updatedAt!,
        dateTitle: 'Date Time Update',
      );
    }

    return const SizedBox();
  }
```
diatas membuat widget untuk menampilkan class model yang sudah dibuat

```dart
                  ElevatedButton(
                    onPressed: () async {
                      final userModel = UserUpdate(
                        name: namecntrlr.text,
                        job: jobcntrlr.text,
                      );
                      final user = await apiService.updateUser(userModel);
                      req = 'PUT';
                      userUpdate = user;
                    },
                    child: const Text('PUT'),
                  ),
```
diatas membuat tombol aksi untuk menampilkan fungsi PUT request yang sudah dibuat sebelumnya, dan namakan dengan string **PUT**

```dart
 case 'PUT':
        return Center(child: hasilPut());
```
diatas membuat switch case statement jika req stringnya **POST** akan menampilkan widget hasilPost();


**Tombol 4: gunakan tombol keempat untuk melakukan DELETE request menggunakan Dio, untuk request ke url: https://reqres.in/api/users/4.**

```dart
  Future<int?> deleteUser() async {
    try {
      var response = await dio.delete('https://reqres.in/api/users/4');
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }
```
diatas membuat fungsi untuk melakukan DELETE request

```dart
                  ElevatedButton(
                    onPressed: () {
                      apiService.deleteUser();
                      req = 'DELETE';
                    },
                    child: const Text('DELETE'),
                  ),
```
diatas membuat tombol aksi untuk menampilkan fungsi DELETE request yang sudah dibuat sebelumnya, dan namakan dengan string **DELETE**

Hasil dari Task 01

![gif task01](/25_Introduction%20REST%20API%20-%20JSON%20serializationdeserialization/screenshots/GIF1.gif)

![gif task01](/25_Introduction%20REST%20API%20-%20JSON%20serializationdeserialization/screenshots/GIF2.gif)

![gif task01](/25_Introduction%20REST%20API%20-%20JSON%20serializationdeserialization/screenshots/GIF3.gif)

### Task 02
#### Buatlah sebuah Object/Map dari suatu Class(Model Class) menggunakan hasil/response dari soal nomor 1(b).
```dart
class UserCreate {
  String? id;
  String name;
  String job;
  String? createdAt;

  UserCreate({
    this.id,
    required this.name,
    required this.job,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'job': job};
  }
}  
```
diatas membuat model dengan nama UserCreate yang didalam class membuat methode toMap dengan tipe data MAP yang return nama dan job

```dart
  Future<UserCreate> createUser(UserCreate user) async {
    try {
      var response = await dio.post(
        'https://reqres.in/api/users',
        data: user.toMap(),
      );
      var userFromResponse = UserCreate.fromJson(response.data);
      return userFromResponse;
    } catch (e) {
      rethrow;
    }
  }
```
diatas membuat fungsi dengan parameter class UserCreate, dan dalam fungsi membuat variable response yang berisi post request. post request tersebut berisi 2 variable yang pertama link apinya, yang kedua data dengan nilai user.toMap(methode pada class UserCreate) 

```dart
final userModel = UserCreate(
name: namecntrlr.text,
job: jobcntrlr.text,
);
final user = await apiService.createUser(userModel);
userCreate = user;
```
diatas membuat variable userModel dengan nilai class UserCreate yang berisi 2 parameter namecontroller dan jobcontroller 

Hasil dari Task 02

![gif task02](/25_Introduction%20REST%20API%20-%20JSON%20serializationdeserialization/screenshots/GIF1.gif)

![gif task02](/25_Introduction%20REST%20API%20-%20JSON%20serializationdeserialization/screenshots/GIF2.gif)

![gif task02](/25_Introduction%20REST%20API%20-%20JSON%20serializationdeserialization/screenshots/GIF3.gif)