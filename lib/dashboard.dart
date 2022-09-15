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
        ),
        body: Stack(
          children: <Widget>[
            my_back_ground,
          ],
        ),
      );
}
