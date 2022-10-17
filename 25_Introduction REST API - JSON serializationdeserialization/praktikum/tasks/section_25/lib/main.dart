import 'package:flutter/material.dart';
import 'models/user_model.dart';
import 'services/api_service.dart';
import 'models/user.dart';
import 'widgets/placeholder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:
          'Flutter Introduction REST API - JSON serialization/deserialization',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final namecntrlr = TextEditingController();
  final jobcntrlr = TextEditingController();
  List<UserModel> users = [];
  UserUpdate? userUpdate;
  UserCreate? userCreate;
  String req = '';
  final ApiService apiService = ApiService();

  @override
  void dispose() {
    namecntrlr.dispose();
    jobcntrlr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
         elevation: 0,
      ),
      body: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final user = await apiService.fetchUser();
                      req = 'GET';
                      users = user.toList();
                    },
                    child: const Text('GET'),
                  ),
                  const SizedBox(width: 20),
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
                  const SizedBox(width: 20),
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
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      apiService.deleteUser();
                      req = 'DELETE';
                    },
                    child: const Text('DELETE'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Result $req :',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: hasilRequest(),
              )
            ],
          ),
        ),
    );
  }

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

  Widget hasilRequest() {
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
      case 'POST':
        return Center(child: hasilPost());
      case 'PUT':
        return Center(child: hasilPut());
      case 'DELETE':
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }
}
