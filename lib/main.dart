import 'package:flutter/material.dart';
import 'package:todo_app/Todo_App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firebase;
  await firebase.initializeApp();
  runApp(TodoApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoApp(),
    );
  }
}
