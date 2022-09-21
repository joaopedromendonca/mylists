import 'package:flutter/material.dart';
import 'package:mylists/models/estilos.dart';
import 'package:mylists/models/listas.dart';

class ListDashboard extends StatefulWidget {
  const ListDashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<ListDashboard> createState() => _ListDashboardState();
}

class _ListDashboardState extends State<ListDashboard> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.all(8),
              icon: const Icon(
                Icons.add,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: <Widget>[
              Form(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.black45,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Insira o nome da nova lista',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                        child: Text(
                          'Criar',
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
