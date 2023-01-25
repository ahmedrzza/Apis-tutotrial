import 'package:apischapter10/Second_example.dart';
import 'package:apischapter10/first_example.dart';
import 'package:apischapter10/third_Example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Third_Example(),
      ),
    );
  }
}
