
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/data/repository/repository_impl.dart';
part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantListState> {
  RestaurantCubit() : super(RestaurantListInitial());
  RepositoryImpl repo = RepositoryImpl();

  void getRestaurant() async{
    emit(OnLoadingGetRestaurant());
    Future.delayed(Duration(seconds: 2),()async{
      var data = await repo.getRestaurant();
      if(data!=null){
        emit(OnSuccessGetRestaurant(data: data));
      }else{
        emit(OnFailedGetRestaurant(message: "something went wrong"));
      }
    });

  }
}
