import 'package:flutter/material.dart';
import 'package:loginapp/api.dart';
import 'package:loginapp/apiall.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { //permite a navegação
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage()
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Variavel que observa o que o usuário digita
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();

  //Variaveis para logar
  String correctUser = "vinicin";
  String correctPassword = "123";

  //Variavel para mostrar a mensagem do erro 
  String erro = "";


  void login() { //se der tudo certo navega para outra pagina.
    if(user.text == correctUser && password.text == correctPassword){
      Navigator.push(context,MaterialPageRoute(builder: (context)=> ApiPage()));

    }else {
      setState(() { //permite alterar o valor da variavel 
        erro = "Existem credenciais erradas";
      });
    }

  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Icon(Icons.person,size: 150 , color: Colors.white,),
              Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 80),
              child:  TextField( //campo para o usuario digitar as informações
                controller: user,
                style: TextStyle(color: Colors.white), 
                decoration: InputDecoration(
                  hintText: "Insira o seu nome",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder( //colocar borda no texfield 
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.white
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.white
                    )
                  )
                ),
              ),
              ),
             

             Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 80, vertical: 30),
              child:  TextField( //campo para o usuario digitar as informações
                controller: password,
                style: TextStyle(color: Colors.white), 
                decoration: InputDecoration(
                  hintText: "Insira  sua senha ",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder( //colocar borda no texfield 
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.white
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.white
                    )
                  )
                ),
              ),
              ),

              ElevatedButton(
              style: ElevatedButton.styleFrom( //muda o estilo do botao 
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                backgroundColor: Colors.white, //cor de fundo 
                foregroundColor: Colors.black , //cor do texto
              ) ,
              onPressed: login, 
              child: Text("Login")),
              Padding(padding: EdgeInsetsGeometry.all(20),
              child: Text("$erro",style: TextStyle(color: Colors.red),))
              
             
              


            ],
          ),
        )


      )
      
    );
  }
}

