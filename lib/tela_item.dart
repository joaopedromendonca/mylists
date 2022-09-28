// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylists/models/estilos.dart';
import 'package:mylists/tarefa.dart';

class TelaItem extends StatefulWidget {
  final ItemTarefa tarefa;
  const TelaItem({super.key, required this.tarefa});

  @override
  State<TelaItem> createState() => _TelaItemState();
}

class _TelaItemState extends State<TelaItem> {
  Future<bool?> showWarning(BuildContext context) async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
              "Deseja voltar à lista de itens? Suas alterações não salvas serão perdidas."),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("Sim"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("Não"),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    String? _temp_value;
    final _descricaoController =
        TextEditingController(text: widget.tarefa.descricao);

    return WillPopScope(
      onWillPop: () async {
        final _shouldPop = await showWarning(context);
        return _shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                print("Entrou save");
                widget.tarefa.descricao = _descricaoController.text;
                print(widget.tarefa.descricao);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Stack(children: [
          BackGround(),
          Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Insira a descrição do item',
              ),
              keyboardType: TextInputType.text,
              maxLines: 8,
              minLines: 4,
              controller: _descricaoController,
            ),
          ),
        ]),
      ),
    );
  }
}
