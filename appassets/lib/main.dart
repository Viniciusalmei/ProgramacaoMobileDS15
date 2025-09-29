import 'package:appassets/tela2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}
//CEntralizadora
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaAssets()
    );
  }
}


class TelaAssets extends StatelessWidget {
  const TelaAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( //tema padrao do app
        textTheme:GoogleFonts.oswaldTextTheme() //Tema do texto padrao
      ), 
      home: Scaffold(
        appBar: AppBar(title: Text("Tela Assets"),
        centerTitle: true, //deixa o titulo no centro
        backgroundColor: Colors.blue, //muda a cor de fundo
        toolbarHeight: 200, //aumenta o tamanho da appbar

        
        ),
        body: Center( //ajuda a centralizar
          child: Column( //coloca os elementos um abaixo do outro
            children: [ //pode ter varios elementos filhos
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbX-f5wvTdBljUzk9j-MnZDW-qj7Il-hfAVg&s",
              width: 150), //Componente que pega uma imagem da internet
              Image.asset("assets/images/doberman.jpg"), //componente que pega uma imagem do projeto
              Text("Essa é a sua fonte do projeto",
              style: TextStyle(fontFamily: "Oswald")),
              Text("Esse é o exemplo com biblioteca"
               ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Tela2()));
              }, child: Icon(Icons.play_arrow))

            ],
          )
        )
      )

    );
  }
}