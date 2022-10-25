import 'package:flutter/material.dart';
import 'package:section_27/services/api/food_api.dart';

import '../models/food_model.dart';

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
