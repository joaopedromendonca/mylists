// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mylists/home_page.dart';
import 'package:mylists/templates/estilos.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const lightBlueColor = Color.fromARGB(255, 37, 131, 247);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // remove the root page back button
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: appBarBackGround(),
      ),
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: backGround(
          Stack(
            children: <Widget>[
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Welcome to Builder',
                          style: TextStyle(
                            color: lightBlueColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  PageTransition(
                      type: PageTransitionType.rightToLeftJoined,
                      childCurrent: widget,
                      duration: Duration(milliseconds: 500),
                      reverseDuration: Duration(milliseconds: 500),
                      child: HomePage()),
                ),
                icon: Icon(Icons.next_plan),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
