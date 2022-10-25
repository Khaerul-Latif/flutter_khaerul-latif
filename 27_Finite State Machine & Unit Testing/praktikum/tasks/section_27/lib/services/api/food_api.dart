import 'package:dio/dio.dart';
import 'package:section_27/models/food_model.dart';

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
