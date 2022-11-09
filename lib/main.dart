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
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          tileColor: Color.fromARGB(255, 23, 202, 53),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Color.fromARGB(237, 7, 175, 241),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.lightBlue,
          cursorColor: Color.fromARGB(255, 10, 82, 216),
        ),
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}
