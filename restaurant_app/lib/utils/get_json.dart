import 'package:flutter/services.dart';

Future<String> getJson({String? fileName}) {
  return rootBundle.loadString("assets/json/$fileName");
}