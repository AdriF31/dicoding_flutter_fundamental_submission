import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_app/modules/review/cubit/create_review_cubit.dart';
import 'package:restaurant_app/utils/theme/text_style.dart';
import 'package:restaurant_app/utils/widgets/elevated_button_widget.dart';

import '../../../utils/theme/color.dart';

class CreateReviewView extends StatefulWidget {
  final String? id;

  const CreateReviewView({super.key, required this.id});

  @override
  State<CreateReviewView> createState() => _CreateReviewViewState();
}

class _CreateReviewViewState extends State<CreateReviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buat Review"),
        centerTitle: true,
      ),
      body: BlocListener<CreateReviewCubit, CreateReviewState>(
        listener: (context, state) {
          if (state is OnSuccessPostReview) {
            Fluttertoast.showToast(msg: state.data?.message ?? "");
            Navigator.pop(context);
          } else if (state is OnFailedPostReview) {
            Fluttertoast.showToast(msg: state.message ?? "");
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama",style: text16PW400,),
                  SizedBox(height: 8,),
                  TextField(
                    controller: context.read<CreateReviewCubit>().nameController,
                    decoration: InputDecoration(
                        hintText: "Masukkan Nama",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    style: text16PW400,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Review",style: text16PW400),
                  SizedBox(height: 8,),
                  TextField(
                    controller:
                        context.read<CreateReviewCubit>().reviewController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Review",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    style: text16PW400,
                    maxLines: 5,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(height: 24,),
              ElevatedButtonWidget(
                buttonText: "Submit Review",
                onPressed:
                    (context.read<CreateReviewCubit>().nameController.text ?? "")
                                .isNotEmpty &&
                            (context
                                        .read<CreateReviewCubit>()
                                        .reviewController
                                        .text ??
                                    "")
                                .isNotEmpty
                        ? () {
                            context.read<CreateReviewCubit>().postReview(id: widget.id);
                          }
                        : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
