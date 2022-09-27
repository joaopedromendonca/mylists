import 'package:flutter/material.dart';

class ItemMenu {
  final String nome;
  final IconData icone;

  const ItemMenu({required this.nome, required this.icone});
}

class Menu {
  static const List<ItemMenu> primeiraLista = [
    itemConfig,
    itemEditar,
    itemCalendario,
  ];

  static const itemEditar = ItemMenu(
    nome: "Editar",
    icone: Icons.edit,
  );

  static const itemConfig = ItemMenu(
    nome: "Configurações",
    icone: Icons.settings,
  );

  static const itemCalendario = ItemMenu(
    nome: "Calendario",
    icone: Icons.calendar_month,
  );
}
