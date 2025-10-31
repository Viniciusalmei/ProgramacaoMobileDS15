import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController? temperature =  TextEditingController();
  @override
  void initState() {
    super.initState();
    postValue();

  }
  
  Future<void> postValue() async {
    try {
      FirebaseFirestore.instance.collection("temperature").add(
        {
          
          "temperatura": temperature!.text,
        }
      );
    }catch(e){
      print("Erro ao enviar $e");
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: temperature == null ? CircularProgressIndicator() : Column(children: [
          TextField(
            controller: temperature,
          ),
          ElevatedButton(onPressed: () {
            postValue();
          }, child: Text("Enviar")) 
        ],),
      ),
    );
  }
}