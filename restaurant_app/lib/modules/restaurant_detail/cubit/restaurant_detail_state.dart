part of 'restaurant_detail_cubit.dart';

@immutable
abstract class RestaurantDetailState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RestaurantDetailInitial extends RestaurantDetailState {}

class OnSuccessGetRestaurantDetail extends RestaurantDetailState {
  RestaurantDetailModel? data;
  OnSuccessGetRestaurantDetail({this.data});
  @override
  List<Object?> get props => [data];
}

class OnFailedGetRestaurantDetail extends RestaurantDetailState {
  final String? message;
  OnFailedGetRestaurantDetail({required this.message});
  @override
  List<Object?> get props => [message];
}

class OnLoadingGetRestaurantDetail extends RestaurantDetailState {}
