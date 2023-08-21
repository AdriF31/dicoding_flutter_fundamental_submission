import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/repository/repository_impl.dart';

part 'restaurant_detail_state.dart';

class RestaurantDetailCubit extends Cubit<RestaurantDetailState> {
  RestaurantDetailCubit() : super(RestaurantDetailInitial());
  RepositoryImpl repo = RepositoryImpl();

  Connectivity connectivity = Connectivity();

  void getRestaurantDetail({String? id})async{
    emit(OnLoadingGetRestaurantDetail());
    var connection = await connectivity.checkConnectivity();
    if(connection != ConnectivityResult.none){
    try{
      var data = await repo.getDetailRestaurant(id);
      if(data!=null){
        emit(OnSuccessGetRestaurantDetail(data: data));
      }else{
        emit(OnFailedGetRestaurantDetail(message: "something went wrong"));
      }
    }catch(e){
      emit(OnFailedGetRestaurantDetail(message: e.toString()));
    }}else{
      emit(OnFailedGetRestaurantDetail(message: "Koneksi Tidak Tersedia"));
    }

  }
}
