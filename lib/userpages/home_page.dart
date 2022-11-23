// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mylists/models/projeto.dart';
import 'package:mylists/templates/estilos.dart';
import 'package:mylists/userpages/tarefa.dart';
import 'package:mylists/utils/proxydecorator.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _editFormKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _user = FirebaseAuth.instance.currentUser;
  List<Projeto> projetos = [];

  @override
  void initState() {
    var projetosDoc = FirebaseFirestore.instance
        .collection('usuarios')
        .doc(_user!.email)
        .collection('projetos')
        .get();

    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(_user!.email)
        .collection('projetos')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        projetos.add(
          Projeto(
              nome: doc['nome'],
              dataCriacao: (doc['dataCriacao'] as Timestamp).toDate(),
              descricao: doc['descricao']),
        );
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: Icon(Icons.logout),
        ),
        elevation: 0,
        flexibleSpace: appBarBackGround(),
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
                context: context,
                builder: (context) => AlertDialog(
                  insetPadding: EdgeInsets.all(50),
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          showCursor: true,
                          autofocus: true,
                          controller: _nomeController,
                          validator: (nome) {
                            if (nome == null || nome.isEmpty) {
                              return "Este campo é obrigatório.";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text('Nome da tarefa'),
                            hintText: "Insira o nome da tarefa",
                            border: InputBorder.none,
                          ),
                          onFieldSubmitted: (_) => criaProjeto(),
                        ),
                        TextFormField(
                          showCursor: true,
                          autofocus: true,
                          controller: _descricaoController,
                          validator: (desc) {
                            if (desc == null || desc.isEmpty) {
                              return "Este campo é obrigatório.";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Insira a descrição da tarefa",
                            border: InputBorder.none,
                          ),
                          onFieldSubmitted: (_) => criaProjeto(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: backGround(
          ReorderableListView.builder(
            proxyDecorator: proxyDecorator,
            itemCount: projetos.length,
            itemBuilder: (BuildContext context, int index) {
              final projeto = projetos[index];
              return Card(
                key: ValueKey(projeto),
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  key: ValueKey(projeto),
                  title: Text(projeto.nome),
                  onTap: () => Navigator.of(context).push(
                    PageTransition(
                        type: PageTransitionType.rightToLeftJoined,
                        childCurrent: widget,
                        duration: Duration(milliseconds: 500),
                        reverseDuration: Duration(milliseconds: 500),
                        child: TelaProjeto(projeto: projeto)),
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
              ;
            },
            padding: const EdgeInsets.all(8),
            onReorder: (int oldIndex, int newIndex) {
              if (newIndex > oldIndex) newIndex--;
              setState(() {
                var tarefa = projetos[oldIndex];
                projetos.removeAt(oldIndex);
                projetos.insert(newIndex, tarefa);
              });
            },
          ),
        ),
      ),
    );
  }

  void criaProjeto() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        Navigator.of(context).pop();
        var projeto = Projeto(
          nome: _nomeController.text.trim(),
          descricao: _descricaoController.text.trim(),
          dataCriacao: DateTime.now(),
        );
        _nomeController.clear();
        _descricaoController.clear();

        FirebaseFirestore.instance
            .collection('usuarios')
            .doc(_user!.email)
            .collection('projetos')
            .doc(projeto.dataCriacao.toString())
            .set(
          {
            'nome': projeto.nome,
            'descricao': projeto.descricao,
            'dataCriacao': projeto.dataCriacao
          },
        );
        return projetos.add(
          projeto,
        );
      }
    });
  }

  void editar(int index) => showDialog(
        context: context,
        builder: ((context) {
          final projeto = projetos[index];
          return AlertDialog(
            content: Form(
              key: _editFormKey,
              child: TextFormField(
                autofocus: true,
                initialValue: projeto.nome,
                validator: (nome) {
                  if (nome == null || nome.isEmpty) {
                    return "Este campo é obrigatório.";
                  }
                  return null;
                },
                onFieldSubmitted: (nome) => setState(() {
                  if (_editFormKey.currentState!.validate()) {
                    Navigator.of(context).pop();
                    projeto.nome = nome;
                    FirebaseFirestore.instance
                        .collection('usuarios')
                        .doc(_user!.email)
                        .collection('projetos')
                        .doc(projeto.dataCriacao.toString())
                        .set(
                      {
                        'nome': projeto.nome,
                        'descricao': projeto.descricao,
                        'dataCriacao': projeto.dataCriacao
                      },
                    );
                    return projetos.add(
                      projeto,
                    );
                  }
                }),
              ),
            ),
          );
        }),
      );

  void deletar(int index) => setState(
        () {
          var projeto = projetos[index];
          FirebaseFirestore.instance
              .collection('usuarios')
              .doc(_user!.email)
              .collection('projetos')
              .doc(projeto.dataCriacao.toString())
              .delete();
          ;
          projetos.removeAt(index);
        },
      );
}
