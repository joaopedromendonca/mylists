// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylists/models/estilos.dart';
import 'package:mylists/tela_item.dart';
import 'package:page_transition/page_transition.dart';

import 'models/botao_menu.dart';

class Tarefa {
  String nome;

  Tarefa({
    required this.nome,
  });
}

class ItemTarefa {
  String nome;
  String? descricao;

  ItemTarefa({required this.nome});
}

class TelaTarefa extends StatefulWidget {
  final String nome;
  const TelaTarefa({super.key, required this.nome});

  @override
  State<TelaTarefa> createState() => _TelaTarefaState();
}

class _TelaTarefaState extends State<TelaTarefa> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  List<ItemTarefa> ListaItens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nome),
        centerTitle: true,
        actions: [
          PopupMenuButton<ItemMenu>(
            itemBuilder: (context) => [
              ...Menu.primeiraLista.map(buildItem).toList(),
            ],
            onSelected: (value) {
              if (value.nome == "Novo item") {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Form(
                      key: _formKey,
                      child: TextFormField(
                        autofocus: true,
                        controller: _nomeController,
                        validator: (nome) {
                          if (nome == null || nome.isEmpty) {
                            return "Este campo é obrigatório.";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Insira o nome da tarefa"),
                        onFieldSubmitted: (nome) => setState(() {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pop();
                            _nomeController.clear();
                            return ListaItens.add(ItemTarefa(nome: nome));
                          }
                        }),
                      ),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            BackGround(),
            ReorderableListView.builder(
              itemCount: ListaItens.length,
              itemBuilder: (BuildContext context, int index) {
                final tarefa = ListaItens[index];
                return Card(
                    key: ValueKey(tarefa),
                    color: Color.fromARGB(255, 22, 205, 230),
                    elevation: 1,
                    margin: const EdgeInsets.all(2),
                    child: ListTile(
                      key: ValueKey(tarefa),
                      title: Text(tarefa.nome),
                      onTap: () => Navigator.of(context).push(
                        PageTransition(
                            type: PageTransitionType.rightToLeftJoined,
                            childCurrent: widget,
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            child: TelaItem(nome: tarefa.nome)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      // trailing: Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: <Widget>[
                      //     IconButton(
                      //       onPressed: (() => editar(index)),
                      //       icon: Icon(Icons.edit),
                      //     ),
                      //     IconButton(
                      //       onPressed: (() => deletar(index)),
                      //       icon: Icon(Icons.delete),
                      //     )
                      //   ],
                      // ),
                    ));
              },
              padding: const EdgeInsets.all(8),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final ItemTarefa item = ListaItens.removeAt(oldIndex);
                  ListaItens.insert(newIndex, item);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<ItemMenu> buildItem(ItemMenu item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(item.icone, color: Colors.lightBlue, size: 20),
            const SizedBox(width: 12),
            Text(item.nome),
          ],
        ),
      );
}
