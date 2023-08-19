import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/modules/restaurant_list/page/restaurant_list_page.dart';
import 'package:restaurant_app/utils/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () =>Navigator.pushReplacementNamed(context, RestaurantListPage.routeName));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/food_splash.json"),
            Text("Restaurant App",style: text16PW700.copyWith(fontSize: 28 ),),
          ],
        ),
      ),
    );
  }
}
