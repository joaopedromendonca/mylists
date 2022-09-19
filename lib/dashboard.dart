import 'package:flutter/material.dart';
import 'package:mylists/models/estilos.dart';

class MinhasListas extends StatelessWidget {
  const MinhasListas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
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
        body: Stack(
          children: <Widget>[
            my_back_ground,
          ],
        ),
      );
}
