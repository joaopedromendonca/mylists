// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylists/templates/estilos.dart';
import 'package:mylists/tarefa.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _editFormKey = GlobalKey<FormState>();
  List<Tarefa> ListaDeTarefas = [];
  final _nomeController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.all(8),
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {
              showDialog(
                barrierColor: Colors.blue,
                context: context,
                builder: (context) => AlertDialog(
                  content: Form(
                    key: _formKey,
                    child: TextFormField(
                      showCursor: true,
                      autofocus: true,
                      controller: _nomeController,
                      validator: (nome) {
                        if (nome == null || nome.isEmpty) {
                          return "Este campo é obrigatório.";
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(hintText: "Insira o nome da tarefa"),
                      onFieldSubmitted: (nome) => setState(() {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                          _nomeController.clear();
                          return ListaDeTarefas.add(Tarefa(nome: nome));
                        }
                      }),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackGround(),
            ReorderableListView.builder(
              itemCount: ListaDeTarefas.length,
              itemBuilder: (BuildContext context, int index) {
                final tarefa = ListaDeTarefas[index];
                return Card(
                    key: ValueKey(tarefa),
                    elevation: 0,
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      tileColor: Colors.amber,
                      key: ValueKey(tarefa),
                      title: Text(tarefa.nome),
                      onTap: () => Navigator.of(context).push(
                        PageTransition(
                            type: PageTransitionType.rightToLeftJoined,
                            childCurrent: widget,
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            child: TelaTarefa(nome: tarefa.nome)),
                      ),
                      selectedTileColor: Colors.transparent,
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
                    ));
              },
              padding: const EdgeInsets.all(8),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final Tarefa tarefa = ListaDeTarefas.removeAt(oldIndex);
                  ListaDeTarefas.insert(newIndex, tarefa);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void editar(int index) => showDialog(
        context: context,
        builder: ((context) {
          final tarefa = ListaDeTarefas[index];
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
        ListaDeTarefas.removeAt(index);
      });
}
