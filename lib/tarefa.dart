// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylists/models/estilos.dart';

import 'models/botao_menu.dart';

class Tarefa {
  String nome;

  Tarefa({
    required this.nome,
  });
}

class TelaTarefa extends StatelessWidget {
  final String nome;
  const TelaTarefa({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
        centerTitle: true,
        actions: [
          PopupMenuButton<ItemMenu>(
            itemBuilder: (context) => [
              ...Menu.primeiraLista.map(buildItem).toList(),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            BackGround(),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<ItemMenu> buildItem(ItemMenu item) => PopupMenuItem(
        child: Text(item.nome),
      );
}
