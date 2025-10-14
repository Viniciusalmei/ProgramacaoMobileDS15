import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NavBar());
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0; //variavel indice atual

  void changeIndex(int index) { //funcao para mudar o indice 
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [
    TelaHome(),
    Tela2(),
    Tela3()

  ]; //lista que contem todas as nossas telas

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//prove os componentes para a sua tela 
      home: Scaffold(
          body: screens.elementAt(currentIndex), //O conteudo será a tela que está o index atual
          bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem> [
             


          ]
          
          
          )

      )

    );
  }
}
