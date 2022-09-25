// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylists/models/estilos.dart';
import 'package:mylists/models/tarefa.dart';
import 'package:mylists/custom_page_route.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyLists',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const HomePage(),
    );
  }
}

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
            myBackGround,
            ReorderableListView.builder(
              itemCount: ListaDeTarefas.length,
              itemBuilder: (BuildContext context, int index) {
                final tarefa = ListaDeTarefas[index];
                return buildTarefa(index, tarefa);
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

  Widget buildTarefa(int index, Tarefa tarefa) => ListTile(
        key: ValueKey(tarefa),
        title: Text(tarefa.nome),
        onTap: () => Navigator.of(context).push(
          PageTransition(
              type: PageTransitionType.rightToLeftJoined,
              childCurrent: widget,
              duration: Duration(milliseconds: 500),
              reverseDuration: Duration(milliseconds: 500),
              child: telaTarefa(nome: tarefa.nome)),
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
      );

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
