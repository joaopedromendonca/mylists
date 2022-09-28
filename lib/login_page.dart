// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylists/models/estilos.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackGround(),
      ]),
    );
  }
}
