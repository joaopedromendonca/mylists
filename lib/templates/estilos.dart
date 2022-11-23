// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

const mediumBlueColor = Color.fromARGB(255, 37, 131, 247);
const lightBlueColor = Color.fromARGB(255, 140, 192, 255);
const strongBlueColor = Color.fromARGB(255, 2, 91, 199);
const lightBlue = Color.fromARGB(255, 113, 196, 252);

Widget backGround(Widget child) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 113, 196, 252),
          Color.fromARGB(255, 90, 156, 252),
          Color.fromARGB(255, 60, 126, 252),
          Color.fromARGB(255, 50, 116, 252),
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
      color: lightBlue,
    ),
  );
}
