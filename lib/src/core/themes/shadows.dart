import 'package:flutter/material.dart';

abstract final class SiShadows {
  const SiShadows._();

  static const List<BoxShadow> low = [
    BoxShadow(
      color: Color.fromARGB(60, 0, 0, 0),
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color.fromARGB(100, 0, 0, 0),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 1,
    ),
  ];

  static const List<BoxShadow> high = [
    BoxShadow(
      color: Color.fromARGB(130, 0, 0, 0),
      offset: Offset(0, 8),
      blurRadius: 20,
      spreadRadius: 2,
    ),
  ];
}
