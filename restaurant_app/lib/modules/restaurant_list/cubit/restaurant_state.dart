part of 'restaurant_cubit.dart';

@immutable
abstract class RestaurantListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RestaurantListInitial extends RestaurantListState {}

class OnLoadingGetRestaurant extends RestaurantListState {}

class OnSuccessGetRestaurant extends RestaurantListState {
  final RestaurantModel? data;
  OnSuccessGetRestaurant({required this.data});
  @override
  List<Object?> get props => [data];
}

class OnFailedGetRestaurant extends RestaurantListState {
  final String? message;
  OnFailedGetRestaurant({required this.message});
  @override
  List<Object?> get props => [message];
}
