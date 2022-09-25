import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mylists/models/estilos.dart';

import 'botao_menu.dart';

class Tarefa {
  String nome;

  Tarefa({
    required this.nome,
  });
}

class telaTarefa extends StatelessWidget {
  final String nome;
  const telaTarefa({super.key, required this.nome});

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
          children: <Widget>[
            myBackGround,
          ],
        ),
      ),
    );
  }

  PopupMenuItem<ItemMenu> buildItem(ItemMenu item) => PopupMenuItem(
        child: Text(item.nome),
      );
}
