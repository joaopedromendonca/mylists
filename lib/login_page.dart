// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mylists/google_sign_in.dart';
import 'package:mylists/home_page.dart';
import 'package:mylists/templates/estilos.dart';
import 'package:page_transition/page_transition.dart';
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       // remove the root page back button
  //       automaticallyImplyLeading: false,
  //       elevation: 0,
  //       flexibleSpace: appBarBackGround(),
  //     ),
  //     // backgroundColor: Colors.green,
  //     body: StreamBuilder(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(child: CircularProgressIndicator());
  //         } else if (snapshot.hasError) {
  //           return Center(child: Text('Algo deu errado!'));
  //         } else if (snapshot.hasData) {
  //           return HomePage();
  //         } else {
  //           return SafeArea(
  //             child: backGround(
  //               Stack(
  //                 children: <Widget>[
  //                   SizedBox(
  //                     height: double.infinity,
  //                     child: SingleChildScrollView(
  //                       physics: AlwaysScrollableScrollPhysics(),
  //                       padding: EdgeInsets.symmetric(
  //                         horizontal: 50.0,
  //                         vertical: 20.0,
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Center(
  //                             child: Text(
  //                               'MyDay',
  //                               style: TextStyle(
  //                                 color: mediumBlueColor,
  //                                 fontSize: 40,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(height: 30),
  //                           Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: <Widget>[
  //                               SizedBox(
  //                                 height: 180,
  //                               ),
  //                               ElevatedButton.icon(
  //                                 style: ElevatedButton.styleFrom(
  //                                   backgroundColor: lightBlueColor,
  //                                   minimumSize: Size(double.infinity, 50),
  //                                 ),
  //                                 icon: Icon(
  //                                   Icons.email_outlined,
  //                                   color: mediumBlueColor,
  //                                 ),
  //                                 label: Text(
  //                                   'Login com e-mail',
  //                                   style: TextStyle(
  //                                     color: strongBlueColor,
  //                                   ),
  //                                 ),
  //                                 onPressed: () => Navigator.of(context).push(
  //                                   PageTransition(
  //                                       type: PageTransitionType
  //                                           .rightToLeftJoined,
  //                                       childCurrent: widget,
  //                                       duration: Duration(milliseconds: 500),
  //                                       reverseDuration:
  //                                           Duration(milliseconds: 500),
  //                                       child: HomePage()),
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 height: 20,
  //                               ),
  //                               ElevatedButton.icon(
  //                                 style: ElevatedButton.styleFrom(
  //                                   backgroundColor: lightBlueColor,
  //                                   minimumSize: Size(double.infinity, 50),
  //                                 ),
  //                                 icon: FaIcon(
  //                                   FontAwesomeIcons.google,
  //                                   color: mediumBlueColor,
  //                                 ),
  //                                 label: Text(
  //                                   'Login com google',
  //                                   style: TextStyle(
  //                                     color: strongBlueColor,
  //                                   ),
  //                                 ),
  //                                 onPressed: () {
  //                                   final provider =
  //                                       Provider.of<GoogleSignInProvider>(
  //                                           context,
  //                                           listen: false);
  //                                   provider.googleLogin();
  //                                 },
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 113, 196, 252),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          // height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SizedBox(height: 10),
              ),
              Center(
                child: Transform.scale(
                  scale: 1,
                  child: Image.asset(
                    'banner.png',
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(height: 10),
              ),
              Center(
                child: Transform.scale(
                  scale: 1,
                  child: Image.asset(
                    'banner2.png',
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(height: 10),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                label: Text(
                  'Sign in with google',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
              ),
              Expanded(
                child: SizedBox(height: 10),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 113, 196, 252),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'E-mail',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 113, 196, 252),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Senha',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding: EdgeInsets.all(8),
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
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Container(
                        padding: EdgeInsets.all(8),
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
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(height: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
