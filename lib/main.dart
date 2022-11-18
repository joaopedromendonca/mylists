// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mylists/login_page.dart';

import 'home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  static const lightBlueColor = Color.fromARGB(255, 140, 192, 255);
  static const cardsColor = Color.fromARGB(235, 84, 178, 241);
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: lightBlueColor,
        ),
        backgroundColor: Colors.amber,
        scaffoldBackgroundColor: Color.fromARGB(235, 126, 189, 10),
        cardTheme: CardTheme(
          color: cardsColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        listTileTheme: ListTileThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          tileColor: cardsColor,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: cardsColor,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Color.fromARGB(255, 6, 219, 202),
          cursorColor: Color.fromARGB(255, 0, 40, 114),
        ),
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginPage(),
    );
  }
}
