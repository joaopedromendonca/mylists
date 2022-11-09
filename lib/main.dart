// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardTheme: CardTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        listTileTheme: ListTileThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          tileColor: Color.fromARGB(236, 21, 187, 209),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Color.fromARGB(236, 21, 187, 209),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Color.fromARGB(255, 6, 219, 202),
          cursorColor: Color.fromARGB(255, 0, 40, 114),
        ),
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}
