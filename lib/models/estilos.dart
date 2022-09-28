// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 127, 174, 233),
            Color.fromARGB(255, 78, 143, 218),
            Color.fromARGB(255, 45, 120, 212),
            Color.fromARGB(255, 5, 72, 148),
          ],
        ),
      ),
    );
  }
}
