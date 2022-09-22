// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylists/models/estilos.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylists/models/tarefa.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyLists',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tarefa> ListaDeTarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.all(8),
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {
              setState(() {
                ListaDeTarefas.add(Tarefa());
              });
              print(ListaDeTarefas);
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          my_back_ground,
          ListView(
            children: List<Tarefa>.from(ListaDeTarefas),
          ),
        ],
      ),
    );
  }
}
