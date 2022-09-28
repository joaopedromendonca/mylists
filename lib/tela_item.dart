import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylists/models/estilos.dart';

class TelaItem extends StatefulWidget {
  final String nome;
  const TelaItem({super.key, required this.nome});

  @override
  State<TelaItem> createState() => _TelaItemState();
}

class _TelaItemState extends State<TelaItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        BackGround(),
        Text("xd"),
      ]),
    );
  }
}
