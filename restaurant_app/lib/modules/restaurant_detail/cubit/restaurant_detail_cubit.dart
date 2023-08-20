import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/repository/repository_impl.dart';

part 'restaurant_detail_state.dart';

class RestaurantDetailCubit extends Cubit<RestaurantDetailState> {
  RestaurantDetailCubit() : super(RestaurantDetailInitial());
  RepositoryImpl repo = RepositoryImpl();

  void getRestaurantDetail({String? id})async{
    emit(OnLoadingGetRestaurantDetail());
    try{
      var data = await repo.getDetailRestaurant(id);
      if(data!=null){
        emit(OnSuccessGetRestaurantDetail(data: data));
      }else{
        emit(OnFailedGetRestaurantDetail(message: "something went wrong"));
      }
    }catch(e){
      emit(OnFailedGetRestaurantDetail(message: e.toString()));
    }

  }
}
