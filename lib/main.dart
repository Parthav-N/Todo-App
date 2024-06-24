import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_flutter/todo_screens/add_todo.dart';
import 'package:todo_flutter/todo_screens/auth_screen.dart';
import 'package:todo_flutter/todo_screens/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "", 
      appId: "", 
      messagingSenderId: "",
      projectId: "",
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { // Debug print statement
    return MaterialApp(
      title: "Todo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: const AuthScreen(),
      initialRoute: '/',
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => Home(user: FirebaseAuth.instance.currentUser!),
        '/add_task': (context) => const AddTodo(),  // Add this route
      },

      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, userSnapshot) {
        if(userSnapshot.hasData) {
          return Home(user: userSnapshot.data!);
        } else {
          return const AuthScreen();
        }
      })

    );
  }
}