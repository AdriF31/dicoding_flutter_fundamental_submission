import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_app/modules/restaurant_detail/page/restaurant_detail_page.dart';
import 'package:restaurant_app/modules/restaurant_list/cubit/restaurant_cubit.dart';
import 'package:restaurant_app/modules/restaurant_list/widgets/restaurant_card.dart';

import '../../../utils/theme/theme.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Restoran",
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<RestaurantCubit, RestaurantListState>(
        listener: (context, state) {
          if (state is OnFailedGetRestaurant) {
            Fluttertoast.showToast(msg: state.message ?? "");
          }
        },
        builder: (context, state) {
          if (state is OnSuccessGetRestaurant) {
            var resto = state.data?.restaurants;
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: List.generate(
                        resto!.length,
                        (index) => RestaurantCard(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RestaurantDetailPage(
                                          data: state.data!,
                                          index: index,
                                        ))),
                            imageUrl: resto[index].pictureId,
                            name: resto[index].name,
                            address: resto[index].city,
                            rating: resto[index].rating))),
              ),
            );
          }
          return const Center(
            child: SpinKitDualRing(color: primary,size: 24,)
          );
        },
      ),
    );
  }
}
