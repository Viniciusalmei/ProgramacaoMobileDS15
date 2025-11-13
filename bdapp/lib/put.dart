import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key});

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  Map<String, TextEditingController> controladores = {};
  List? values;


  @override
  void initState() {
    super.initState();
    getValue();
  }

  void getValue(){
    FirebaseFirestore.instance.collection("monitoramento").snapshots().listen(
      (snapshots){
        final data = snapshots.docs;
        setState(() {
          values = data;
          for (var doc in data){ //Para cada documento cria um text field 
            controladores[doc.id] = TextEditingController();
          }

        });
      }
    );///
  }

  void putValue(String id) async {
    await FirebaseFirestore.instance.collection("monitoramento").doc(id).set({
      "temperatura": controladores[id]!.text,
    }, SetOptions(merge:true));

  }


  @override
void dispose() { //funcao para limpar os campos de text field.
  for (var c in controladores.values) {
    c.dispose();
  }
  super.dispose();
}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela Put")),
        body: values == null? CircularProgressIndicator() :
        ListView.builder(itemCount: values!.length,
        itemBuilder: (context, index) {
          final item = values![index];

          return ListTile(
            title: Text("Temperatura atual ${item["temperatura"]}"),
            subtitle: Column(
              children: [
                TextField(
                  controller: controladores[item.id],
                ),
                ElevatedButton(onPressed: (){putValue(item.id);}, child: Text("Enviar"))
              ],
            ),
          );
        },)
      )
    );
  }
}