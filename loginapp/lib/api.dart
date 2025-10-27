import 'dart:convert';

import 'package:applogin/apiall.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  String? value; 

  @override
  void initState() { //funcao que recarrega o estado da pagina , 
  //toda vez ao iniciar a pagina
    super.initState();
    getvalue(); //funcao que busca o valor , sera resetada sempre ao iniciar o app
  }

  void getvalue() async { //funcao que busca o valor 
    final response = await http.get(Uri.parse("https://dummyjson.com/products"));

    if(response.statusCode == 200){//se o status da requisicao for OK 
      //json decode transforma as propriedades do json  em tipos de dados 
      final data = jsonDecode(response.body); 

      setState(() {
        value = data[0]["title"];
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: value == null ? CircularProgressIndicator() : Text("$value")
      )
    );
  }
}