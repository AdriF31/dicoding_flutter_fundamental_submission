import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/review/cubit/create_review_cubit.dart';
import 'package:restaurant_app/modules/review/page/create_review_view.dart';

class CreateReviewPage extends StatelessWidget {
  final String? id;
  const CreateReviewPage({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateReviewCubit>(
      create: (context) => CreateReviewCubit(),
      child: CreateReviewView(id: id,),
    );
  }
}
