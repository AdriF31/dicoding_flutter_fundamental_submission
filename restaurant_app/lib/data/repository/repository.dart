import 'dart:async';

import 'package:restaurant_app/data/model/post_review_model.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/model/restaurant_list_model.dart';

abstract class Repository{
  FutureOr<RestaurantListModel?> getRestaurant();
  FutureOr<RestaurantDetailModel?> getDetailRestaurant(String? id);
  FutureOr<RestaurantListModel?> searchRestaurant(String? q);
  FutureOr<PostReviewModel?> postReview(String? id, String? name, String? review);

}