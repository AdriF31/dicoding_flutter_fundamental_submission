import 'dart:async';
import 'dart:convert';

import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/data/repository/repository.dart';
import 'package:restaurant_app/utils/get_json.dart';

class RepositoryImpl implements Repository{
  @override
  Future<RestaurantModel?> getRestaurant()async {
    try{
      var response = await getJson(fileName: "restaurant.json");
      var dataConverted = jsonDecode(response);
      return RestaurantModel.fromJson(dataConverted);
    }catch(e){
      return null;
    }
  }

}