import 'package:flutter/material.dart';

List<BoxShadow> elevation1 = [
  BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 0.0,
    offset: Offset(0, 1),
  ),
];

List<BoxShadow> elevation2 = [
  BoxShadow(
    color: Colors.black.withOpacity(0.25),
    blurRadius: 1.0,
    offset: Offset(0, 0),
  ),
  BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 1.0,
    offset: Offset(0, 1),
  ),
];

List<BoxShadow> elevation3 = [
  BoxShadow(
    color: Colors.black.withOpacity(0.20),
    blurRadius: 2.0,
    offset: Offset(0, 0),
  ),
  BoxShadow(
    color: Colors.black.withOpacity(0.10),
    blurRadius: 10.0,
    offset: Offset(0, 2),
  ),
];