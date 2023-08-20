import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/data/model/post_review_model.dart';
import 'package:restaurant_app/data/repository/repository_impl.dart';

part 'create_review_state.dart';

class CreateReviewCubit extends Cubit<CreateReviewState> {
  CreateReviewCubit() : super(CreateReviewInitial());
  RepositoryImpl repo = RepositoryImpl();
  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();

  void postReview({String? id}) async {
    emit(OnLoadingPostReview());
    try {
      var data =
          await repo.postReview(id, nameController.text, reviewController.text);
      if (data?.error == false) {
        emit(OnSuccessPostReview(data: data));
      } else {
        emit(OnFailedPostReview(data: data));
      }
    } catch (e) {
      emit(OnFailedPostReview());
    }
  }
}
