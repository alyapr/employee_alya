import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
  
  static void addNewEmployee(String text) {}
}

class _AddEmployeeState extends State<AddEmployee> {
  final TextEditingController _textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Karyawan'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(hintText: "Masukkan nama karyawan"),
                  ),
                ),
                IconButton(icon: const Icon(Icons.add),
                onPressed: (){
                  AddEmployee.addNewEmployee(_textController.text);
                  _textController.clear();
                },)
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<Map<String, String>>
            (stream: _AddEmployeeState.getEmployeelist(),
             builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, String> item = snapshot.data!;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index){
                    final key = items.keys.elemantAt(index);
                    final item = items[key];
                    return ListTile(
                      title: Text(item!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: (){
                          _AddEmployeeState.removeEmployee(key);
                        }
                    )
                    
                  }
                )
              }
             }
            )
          )
        ],
      ),
    ),
    throw UnimplementedError();
  }
  
  static getEmployeelist() {}
}
