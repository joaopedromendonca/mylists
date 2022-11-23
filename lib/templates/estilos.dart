// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

Widget backGround(Widget child) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 140, 192, 255),
          Color.fromARGB(255, 130, 182, 255),
          Color.fromARGB(255, 120, 172, 255),
          Color.fromARGB(255, 110, 162, 255),
        ],
      ),
    ),
    child: child,
  );
}

Widget appBarBackGround() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 140, 192, 255),
    ),
  );
}
