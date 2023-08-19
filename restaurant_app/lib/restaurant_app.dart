import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/restaurant_list/page/restaurant_list_page.dart';
import 'package:restaurant_app/modules/splashscreen/splashscreen.dart';
import 'package:restaurant_app/utils/theme/theme.dart';

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant app',
      routes: {
        RestaurantListPage.routeName:(context)=>RestaurantListPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: primary,
        )
      ),
      home: const SplashScreen(),
    );
  }
}
