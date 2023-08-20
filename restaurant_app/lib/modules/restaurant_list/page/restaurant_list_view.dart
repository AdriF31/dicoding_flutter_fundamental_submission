import 'dart:async';

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
    TextEditingController? controller = TextEditingController();
    Timer? _debounce;
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
            var data = state.data;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                    cursorColor: Colors.blue,
                    onChanged: (value) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce = Timer(const Duration(seconds: 1), () {
                        if (value.isNotEmpty) {
                          context
                              .read<RestaurantCubit>()
                              .searchRestaurant(query: value);
                        } else {
                          context.read<RestaurantCubit>().getRestaurant();
                        }
                      });
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Cari Restoran',
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: const Icon(Icons.search)),
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  state.data.isNotEmpty
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                                children: List.generate(
                                    data.length,
                                    (index) => RestaurantCard(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RestaurantDetailPage(
                                                      id: state.data[index]
                                                              ?.id ??
                                                          "",
                                                    ))),
                                        pictureId: data[index]?.pictureId,
                                        name: data[index]?.name,
                                        address: data[index]?.city,
                                        rating: data[index]?.rating))),
                          ),
                        )
                      : const Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Data tidak ditemukan",
                                style: text16PW400,
                              )
                            ],
                          ),
                      ),
                ],
              ),
            );
          }
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitDualRing(
                color: primary,
                size: 24,
              ),
            ],
          );
        },
      ),
    );
  }
}
