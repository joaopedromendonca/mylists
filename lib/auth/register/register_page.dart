// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylists/templates/estilos.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _confPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confPasswordController.dispose();
    _usuarioController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }

    await FirebaseFirestore.instance.collection('usuarios').add({
      'email': _emailController.text.trim(),
      'senha': _passwordController.text.trim(),
      'usuario': _usuarioController.text.trim()
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confPasswordController.text.trim()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: SafeArea(
        child: backGround(
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 30,
                        color: mediumBlueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Create an account, it\'s free!',
                      style: TextStyle(
                        fontSize: 15,
                        color: mediumBlueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      color: lightBlue,
                      border: Border.all(
                        color: Colors.lightBlue,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      cursorColor: mediumBlueColor,
                      style: TextStyle(height: 2),
                      controller: _usuarioController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_pin_rounded),
                        contentPadding: EdgeInsets.all(4),
                        hintText: 'Usuário',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 113, 196, 252),
                      border: Border.all(
                        color: Colors.lightBlue,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      cursorColor: mediumBlueColor,
                      style: TextStyle(height: 2),
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        contentPadding: EdgeInsets.all(5),
                        hintText: 'E-mail',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 113, 196, 252),
                      border: Border.all(
                        color: Colors.lightBlue,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      cursorColor: mediumBlueColor,
                      style: TextStyle(height: 2),
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        hintText: 'Senha',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 113, 196, 252),
                      border: Border.all(
                        color: Colors.lightBlue,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      cursorColor: mediumBlueColor,
                      style: TextStyle(height: 2),
                      obscureText: true,
                      controller: _confPasswordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        hintText: 'Confirme a senha',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Back to login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
