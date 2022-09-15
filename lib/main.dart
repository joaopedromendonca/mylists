// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylists/dashboard.dart';
import 'package:mylists/models/estilos.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyLists',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          my_back_ground,
          Container(
            child: Center(
              child: ElevatedButton(
                child: const Text('Minhas listas'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MinhasListas()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
