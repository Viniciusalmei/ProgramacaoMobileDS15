import 'package:flutter/material.dart';

void main() {
  runApp(const Contador());
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        
      )
    );
  }
}