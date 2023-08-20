part of 'create_review_cubit.dart';

@immutable
abstract class CreateReviewState extends Equatable{
  @override
  List<Object?> get props => [];
}

class CreateReviewInitial extends CreateReviewState {}

class OnLoadingPostReview extends CreateReviewState {}

class OnSuccessPostReview extends CreateReviewState {
  PostReviewModel? data;
  OnSuccessPostReview({this.data});
  @override
  List<Object?> get props => [data];
}

class OnFailedPostReview extends CreateReviewState {
  PostReviewModel? data;
  OnFailedPostReview({this.data});
  @override
  List<Object?> get props => [data];
}
