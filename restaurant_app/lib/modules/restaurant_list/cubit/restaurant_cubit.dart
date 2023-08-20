
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/data/model/restaurant_list_model.dart';
import 'package:restaurant_app/data/repository/repository_impl.dart';
part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantListState> {
  RestaurantCubit() : super(RestaurantListInitial());
  RepositoryImpl repo = RepositoryImpl();
  List <Restaurant?> resto=[];

  void getRestaurant() async{
    emit(OnLoadingGetRestaurant());
    try{
      var data = await repo.getRestaurant();
      if(data!=null){
        resto = data.restaurants??[];
        emit(OnSuccessGetRestaurant(data: resto));
      }else{
        emit(OnFailedGetRestaurant(message: "something went wrong"));
      }
    }catch(e){
      emit(OnFailedGetRestaurant(message: e.toString()));
    }
  }

  void searchRestaurant({String? query}) async{
    emit(OnLoadingGetRestaurant());
    try{
      var data = await repo.searchRestaurant(query);
      if(data!=null){
        resto = data.restaurants??[];
        emit(OnSuccessGetRestaurant(data: resto));
      }else{
        emit(OnFailedGetRestaurant(message: "something went wrong"));
      }
    }catch(e){
      emit(OnFailedGetRestaurant(message: e.toString()));
    }
  }
}
