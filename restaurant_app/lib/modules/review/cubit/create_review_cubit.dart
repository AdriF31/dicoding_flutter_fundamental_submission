import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/model/post_review_model.dart';
import 'package:restaurant_app/data/repository/repository_impl.dart';

part 'create_review_state.dart';

class CreateReviewCubit extends Cubit<CreateReviewState> {
  CreateReviewCubit() : super(CreateReviewInitial());
  RepositoryImpl repo = RepositoryImpl();
  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  Connectivity connectivity = Connectivity();

  void postReview({String? id}) async {
    emit(OnLoadingPostReview());
    var connectivityResult = await connectivity.checkConnectivity();
    if(connectivityResult != ConnectivityResult.none){
      try {
        var data =
        await repo.postReview(id, nameController.text, reviewController.text);
        if (data?.error == false) {
          emit(OnSuccessPostReview(data: data));
        } else {
          emit(OnFailedPostReview(message: "Something went wrong"));
        }
      } catch (e) {
        emit(OnFailedPostReview(message: e.toString()));
      }
    }else{
      emit(OnFailedPostReview(message: "Koneksi Tidak Tersedia"));
    }

  }
}
