import 'package:flutter/material.dart';

void main() {
  runApp(const Home());//É a funcao que roda o app.
}

//Stateless é estatico
//Statefull é dinamico

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //quem prove os componentes para a tela
      home: Scaffold(//quem separa entre appbar e body
        appBar: AppBar(title: Text("Sua barra superior")),
        body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
              width: 40,
              height: 40,
              color: Color(0XFF123556),
                ),
                  Container(
              width: 40,
              height: 40,
              color: Color(0XFF123556),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),


                  ],

                )
            


          ],
        )
        
       

      )
    );
  }
}


