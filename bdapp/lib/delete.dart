import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  List<dynamic>? values;

  @override
  void initState() {
    super.initState();
    getValues();
  }

  void getValues() {
    FirebaseFirestore.instance.collection("monitoramento").snapshots().listen(
      (snapshots) {
        final data = snapshots.docs;
        setState(() {
          values = data;
        });
      },
    );
  }

  /// Função para deletar um documento pelo ID
  /// Precisa receber o parametro String id ,pois o id de cada item 
  Future<void> deleteValue(String id) async {
    await FirebaseFirestore.instance
        .collection("monitoramento")
        .doc(id)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Delete"),
        backgroundColor: Colors.blueAccent,
      ),
      body: values == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: values!.length,
              itemBuilder: (context, index) {
                final item = values![index];
                return ListTile(title: Text("Temperatura"),
                subtitle: Text("${item['temperatura']}"),
                trailing: GestureDetector(
                  child: Icon(Icons.remove),
                  onTap: () => deleteValue(item.id),
                ),
                );
              },
            ),
    );
  }
}
