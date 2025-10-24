import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiAll extends StatefulWidget {
  const ApiAll({super.key});

  @override
  State<ApiAll> createState() => _ApiAllState();
}

class _ApiAllState extends State<ApiAll> {
  List<dynamic>? value; //variavel vira uma lista , pois recebe varios dados

  @override
  void initState() {
    //funcao que recarrega o estado da pagina ,
    //toda vez ao iniciar a pagina
    super.initState();
    getvalue(); //funcao que busca o valor , sera resetada sempre ao iniciar o app
  }

  void getvalue() async {
    //Funcao que pega o valor do http, precisa ser assincrona
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        //possibilita mudar o estado da variavel
        value = data["products"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Voce pode fazer conjuntos de componentes para cada ocasiao
        body: value == null
            ? Center(child: CircularProgressIndicator())
            : Center(child: ListView.builder(itemCount: value!.length,
            itemBuilder: (context, index) {
              final item = value![index]; //variavel dos itens da lista 
              return Container(
                width: 150,
                height: 150,
                color: Colors.blue,
                child: Text("${item["title"]}"),
              );
            },
            
            )),
      ),
    );
  }
}
