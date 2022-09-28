import 'package:flutter/material.dart';

class ItemMenu {
  final String nome;
  final IconData icone;

  const ItemMenu({required this.nome, required this.icone});
}

class Menu {
  static const List<ItemMenu> primeiraLista = [
    itemNovo,
    itemEditar,
  ];

  static const itemEditar = ItemMenu(
    nome: "Editar",
    icone: Icons.edit,
  );

  static const itemConfig = ItemMenu(
    nome: "Configurações",
    icone: Icons.settings,
  );

  static const itemNovo = ItemMenu(
    nome: "Novo item",
    icone: Icons.create,
  );
}
