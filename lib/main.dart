import 'package:flutter/material.dart';
import 'package:untitled/homepage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Budget Tracker",
      home: homepage(),
    );
  }
}
