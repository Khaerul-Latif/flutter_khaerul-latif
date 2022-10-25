# (09) Collection
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task
### Task 01
1. Buatlah sebuah halaman baru dengan MVVM lengkap untuk menampilkan data dari: https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods


```dart
class Food {
  final int id;
  final String name;

  Food({required this.id, required this.name});
}

```
diatas membuat model food

```dart
class FoodApi {
  Future<List<Food>> getFoods() async {
    final response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');

    List<Food> foods = (response.data as List).map((food) {
      return Food(id: food['id'], name: food['name']);
    }).toList();
    return foods;
  }
}
```
diatas membuat food api untuk mengambil element dalam api

```dart
enum FoodViewState { none, loading, ready, error }

class FoodViewModel with ChangeNotifier {
  FoodViewState _state = FoodViewState.none;
  FoodViewState get state => _state;

  final List<Food> _foods = [];
  List<Food> get foods => List.unmodifiable(_foods);

  final foodApi = FoodApi();

  changeState(FoodViewState s) {
    _state = s;
    notifyListeners();
  }

  getFood() async {
    changeState(FoodViewState.loading);
    try {
      final f = await foodApi.getFoods();
      _foods.addAll(f);
      notifyListeners();
      changeState(FoodViewState.ready);
    } catch (e) {
      changeState(FoodViewState.error);
    }
  }
}
```
diatas membuat class viewmodel dan viewstate, dimana viewmodel tersebut berisi aksi dari viewstate yang dibuat

```dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final foodViewModel = Provider.of<FoodViewModel>(context, listen: false);
      await foodViewModel.getFood();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
      ),
      body: Consumer<FoodViewModel>(
        builder: (context, value, child) {
          if (value.state == FoodViewState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.state == FoodViewState.ready) {
            return listFood(value.foods);
          }
          return const Center(child: Text('Error Happen'));
        },
      ),
    );
  }

  Widget listFood(List<Food> foods) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final food = foods[index].name;
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              foods[index].name[0],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(foods[index].name),
        );
      },
    );
  }
}
```
diatas membuat homescreen yang berisi viewstate dan listfood

Hasil dari Task 01
![Gif dari task01](/27_Finite%20State%20Machine%20&%20Unit%20Testing/screenshots/task01.gif)

### Task 02
2. Dari MVVM di atas, lakukan unit test pada model api dengan menerapkan mocking!
```dart
import 'dart:async' as _i3;
import 'package:section_27/models/food_model.dart' as _i4;
import 'package:section_27/services/api/food_api.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
```
didalam file test api mocking mengubah nama yang diimport  

```dart
class MockFoodApi extends _i1.Mock implements _i2.FoodApi {
  MockFoodApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Food>> getFoods() => (super.noSuchMethod(
        Invocation.method(
          #getFoods,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Food>>.value(<_i4.Food>[]),
      ) as _i3.Future<List<_i4.Food>>);
}
```
diatas membuat class untuk menerapkan mocking dan menurukan class FoodApi yang sudah dibuat. class mocking mengtest class FoodApi yang sudah dibuat tadi

```dart
@GenerateMocks([FoodApi])
```
diatas mengimplementasi mocking ke class FoodApi

```dart
group('FoodApi', () {
    FoodApi foodApi = MockFoodApi();
    test('get all foods returns data', () async {
      when(foodApi.getFoods()).thenAnswer(
        (_) async => <Food>[
          Food(id: 2, name: 'Mi Ayam'),
        ],
      );
      var foods = await foodApi.getFoods();
      expect(foods.isNotEmpty, true);
    });
  });
```
diatas mengetest id dan nama yang ditentukan dengan menerapkan mocking

Hasil dari Task 02
![Gif dari task02](/27_Finite%20State%20Machine%20&%20Unit%20Testing/screenshots/task02(a).gif)

![Gif dari task02](/27_Finite%20State%20Machine%20&%20Unit%20Testing/screenshots/task02(b).gif)