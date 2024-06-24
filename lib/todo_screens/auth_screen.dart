import 'package:flutter/material.dart';
import 'package:todo_flutter/auth_pages/authform.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: const AuthForm(),
    );
  }
}