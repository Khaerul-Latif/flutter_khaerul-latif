import 'package:section_27/services/api/food_api.dart';
import 'package:section_27/models/food_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'foods_api_test.mocks.dart';

@GenerateMocks([FoodApi])
void main() {
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
}
