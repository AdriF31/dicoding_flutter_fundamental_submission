import 'dart:async';

import 'package:dio/dio.dart';
import 'package:restaurant_app/data/model/post_review_model.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/model/restaurant_list_model.dart';
import 'package:restaurant_app/data/network.dart';
import 'package:restaurant_app/data/repository/repository.dart';

class RepositoryImpl implements Repository{
  Network network = Network();
  @override
  Future<RestaurantListModel?> getRestaurant()async {
    try{
      var response = await network.dio.get('/list');
      return RestaurantListModel.fromJson(response.data);
    }on DioError catch(e){
      return RestaurantListModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<RestaurantDetailModel?> getDetailRestaurant(String? id) async{
    try{
      var response = await network.dio.get('/detail/$id');
      return RestaurantDetailModel.fromJson(response.data);
    }on DioError catch(e){
      return RestaurantDetailModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<RestaurantListModel?> searchRestaurant(String? q)async {
    try{
      var response = await network.dio.get('/search',queryParameters: {
        "q":q
      });
      return RestaurantListModel.fromJson(response.data);
    }on DioError catch(e){
      return RestaurantListModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<PostReviewModel?> postReview(String? id, String? name, String? review) async{
    try{
      var response = await network.dio.post('/review',data: {
        "id":id,
        "name":name,
        "review":review,
      });
      return PostReviewModel.fromJson(response.data);
    }on DioError catch(e){
      return PostReviewModel.fromJson(e.response?.data);
    }
  }

}