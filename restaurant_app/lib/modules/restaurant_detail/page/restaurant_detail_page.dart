import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurant_detail/cubit/restaurant_detail_cubit.dart';
import 'package:restaurant_app/modules/restaurant_detail/page/restaurant_detail_view.dart';

class RestaurantDetailPage extends StatelessWidget {
  String? id;
  RestaurantDetailPage({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantDetailCubit>(
      create: (context) => RestaurantDetailCubit()..getRestaurantDetail(id: id),
      child: RestaurantDetailView(id: id,),
    );
  }
}
