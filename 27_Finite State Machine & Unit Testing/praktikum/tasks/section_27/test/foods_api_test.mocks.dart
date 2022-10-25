import 'dart:async' as _i3;
import 'package:section_27/models/food_model.dart' as _i4;
import 'package:section_27/services/api/food_api.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

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
