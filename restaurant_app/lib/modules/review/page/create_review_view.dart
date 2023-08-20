import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_app/modules/review/cubit/create_review_cubit.dart';
import 'package:restaurant_app/utils/theme/text_style.dart';

import '../../../utils/theme/color.dart';

class CreateReviewView extends StatelessWidget {
  final String? id;

  const CreateReviewView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Buat Review"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama"),
                TextField(
                  controller: context.read<CreateReviewCubit>().nameController,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Review"),
                TextField(
                  controller:
                      context.read<CreateReviewCubit>().reviewController,
                ),
              ],
            ),
            BlocListener<CreateReviewCubit, CreateReviewState>(
              listener: (context, state) {
                if(state is OnSuccessPostReview){
                  Navigator.pop(context);
                }else if(state is OnFailedPostReview){
                  Fluttertoast.showToast(msg: state.data?.message ?? "");
                }
              },
              child: InkWell(
                onTap: () {
                  context.read<CreateReviewCubit>().postReview(id: id);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: (context
                                          .read<CreateReviewCubit>()
                                          .nameController
                                          .text ??
                                      "")
                                  .isNotEmpty &&
                              (context
                                          .read<CreateReviewCubit>()
                                          .reviewController
                                          .text ??
                                      "")
                                  .isNotEmpty
                          ? primary
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    "Submit Review",
                    style: text16W400,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
