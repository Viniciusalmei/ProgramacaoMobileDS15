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

  void getvalue() async { //Funcao que pega o valor do http, precisa ser assincrona
    final response = await http.get(Uri.parse("https://viacep.com.br/ws/01001000/json/"));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() { //possibilita mudar o estado da variavel 
        value = data["logradouro"];
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold( //Voce pode fazer conjuntos de componentes para cada ocasiao
          body: value == null ? Center(child:CircularProgressIndicator()) : Center(child:Column(
            children: [
              Text("$value"),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ApiAll()));
              }, child: Text("Ir API"))
            ],
          ))
        )
    );
  }
}