// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylists/home_page.dart';
import 'package:mylists/templates/estilos.dart';
import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: [
            BackGround(),
            Container(
              height: size.height,
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bem vindo ao MyDay",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 72, 148),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    iconSize: size.width * 0.5,
                    onPressed: () => Navigator.of(context).push(
                      PageTransition(
                          type: PageTransitionType.rightToLeftJoined,
                          childCurrent: widget,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: HomePage()),
                    ),
                    icon: Image.asset(
                      "assets/icons/list.png",
                      width: size.width * 0.8,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
