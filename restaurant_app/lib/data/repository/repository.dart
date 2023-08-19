import 'dart:async';

import 'package:restaurant_app/data/model/restaurant_model.dart';

abstract class Repository{
  Future<RestaurantModel?> getRestaurant();
}