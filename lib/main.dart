import 'package:flutter/material.dart';
import 'package:projetouninove/UI/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Uni9',
      home: HomeScreen(),
    );
  }
}
