// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mylists/auth/google_sign_in.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const mediumBlueColor = Color.fromARGB(255, 37, 131, 247);
  static const lightBlueColor = Color.fromARGB(255, 140, 192, 255);
  static const strongBlueColor = Color.fromARGB(255, 2, 91, 199);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 113, 196, 252),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            // height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Transform.scale(
                    scale: 0.6,
                    child: Image.asset(
                      'assets/mdlogo.png',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 113, 196, 252),
                    border: Border.all(
                      color: Colors.lightBlue,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    cursorColor: mediumBlueColor,
                    style: TextStyle(height: 2),
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      contentPadding: EdgeInsets.all(4),
                      hintText: 'E-mail',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 113, 196, 252),
                    border: Border.all(
                      color: Colors.lightBlue,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    cursorColor: mediumBlueColor,
                    style: TextStyle(height: 2),
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      hintText: 'Senha',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                GestureDetector(
                  onTap: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Sign in with google',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ElevatedButton.icon(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.lightBlue,
                //     minimumSize: const Size(double.infinity, 40),
                //   ),
                //   icon: FaIcon(
                //     FontAwesomeIcons.google,
                //     color: Colors.white,
                //   ),
                //   label: Text(
                //     'Sign in with google',
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                //   onPressed: () {
                //     final provider = Provider.of<GoogleSignInProvider>(context,
                //         listen: false);
                //     provider.googleLogin();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
