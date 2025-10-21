import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  String? value; //variavel que vai armazenar o valor 

  @override //precisa do override para subscrever o valor anterior 
  void initState() { //funcao que auxilia a resetar o estado da pagina toda vez que entrar nela.
  super.initState();//super == sempre rodar esta função 
  getvalue(); //funcao que busca o valor 

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
    return const Placeholder();
  }
}