import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tarefa extends StatefulWidget {
  String nome;

  Tarefa({Key? key, required this.nome}) : super(key: key);

  @override
  State<Tarefa> createState() => _TarefaState();
}

class _TarefaState extends State<Tarefa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Form(
            child: Row(
              children: <Widget>[
                Text(
                  widget.nome,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
