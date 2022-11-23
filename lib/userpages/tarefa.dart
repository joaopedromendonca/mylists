// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylists/templates/estilos.dart';
import 'package:mylists/userpages/tela_item.dart';
import 'package:mylists/utils/proxydecorator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mylists/templates/botao_menu.dart';
import 'package:mylists/models/projeto.dart';

class TelaProjeto extends StatefulWidget {
  final Projeto projeto;
  const TelaProjeto({super.key, required this.projeto});

  @override
  State<TelaProjeto> createState() => _TelaProjetoState();
}

class _TelaProjetoState extends State<TelaProjeto> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _editFormKey = GlobalKey<FormState>();
  List<Tarefa> tarefas = [];

  @override
  void initState() {
    tarefas = widget.projeto.tarefas;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: appBarBackGround(),
          elevation: 0,
          // automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.pop(context, true),
          ),
          title: Text(widget.projeto.nome),
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
                              return tarefas.add(Tarefa(nome: nome));
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
          child: backGround(
            ReorderableListView.builder(
              proxyDecorator: proxyDecorator,
              itemCount: tarefas.length,
              itemBuilder: (BuildContext context, int index) {
                final tarefa = tarefas[index];
                return Card(
                  key: ValueKey(tarefa),
                  // elevation: 1,
                  margin: const EdgeInsets.all(6),
                  child: ListTile(
                    key: ValueKey(tarefa),
                    title: Text(tarefa.nome),
                    onTap: () => Navigator.of(context).push(
                      PageTransition(
                          type: PageTransitionType.rightToLeftJoined,
                          childCurrent: widget,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: TelaItem(tarefa: tarefa)),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: (() => editar(index)),
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: (() => deletar(index)),
                          icon: Icon(Icons.delete),
                        )
                      ],
                    ),
                  ),
                );
              },
              padding: const EdgeInsets.all(8),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final Tarefa tarefa = tarefas.removeAt(oldIndex);
                  tarefas.insert(newIndex, tarefa);
                });
              },
            ),
          ),
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

  void editar(int index) => showDialog(
        context: context,
        builder: ((context) {
          final tarefa = tarefas[index];
          return AlertDialog(
            content: Form(
              key: _editFormKey,
              child: TextFormField(
                autofocus: true,
                initialValue: tarefa.nome,
                validator: (nome) {
                  if (nome == null || nome.isEmpty) {
                    return "Este campo é obrigatório.";
                  }
                  return null;
                },
                onFieldSubmitted: (nome) => setState(() {
                  if (_editFormKey.currentState!.validate()) {
                    Navigator.of(context).pop();
                    tarefa.nome = nome;
                  }
                }),
              ),
            ),
          );
        }),
      );

  void deletar(int index) => setState(() {
        tarefas.removeAt(index);
      });
}
