import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurant_list/cubit/restaurant_cubit.dart';
import 'package:restaurant_app/modules/restaurant_list/page/restaurant_list_view.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = "/restaurant_list";
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>RestaurantCubit()..getRestaurant(),child: RestaurantListView(),);
  }
}
