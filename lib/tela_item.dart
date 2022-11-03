// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylists/templates/estilos.dart';
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
    final descricaoController =
        TextEditingController(text: widget.tarefa.descricao);

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                widget.tarefa.descricao = descricaoController.text;
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
              controller: descricaoController,
            ),
          ),
        ]),
      ),
    );
  }
}
