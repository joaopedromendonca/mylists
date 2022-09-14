import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String login;

  const DashboardScreen({
    Key? key,
    required this.login,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
            ),
            child: Text(
              login,
              style: TextStyle(color: Colors.blueGrey),
            ),
            onPressed: () {},
          ),
        ),
      );
}
