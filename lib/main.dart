// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mylists/auth/google_sign_in.dart';
import 'package:mylists/main_page.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  static const lightBlueColor = Color.fromARGB(255, 140, 192, 255);
  static const mediumBlueColor = Color.fromARGB(235, 84, 178, 241);
  static const strongBlueColor = Color.fromARGB(255, 2, 91, 199);
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'MyDay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: lightBlueColor,
          ),
          backgroundColor: lightBlueColor,
          scaffoldBackgroundColor: lightBlueColor,
          cardTheme: CardTheme(
            color: mediumBlueColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          listTileTheme: ListTileThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            tileColor: mediumBlueColor,
          ),
          dialogTheme: DialogTheme(
            backgroundColor: mediumBlueColor,
          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Color.fromARGB(255, 45, 133, 248),
            cursorColor: strongBlueColor,
          ),
          primarySwatch: Colors.lightBlue,
        ),
        home: MainPage(),
      ),
    );
  }
}
