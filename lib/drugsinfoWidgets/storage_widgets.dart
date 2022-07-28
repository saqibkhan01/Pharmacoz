import 'package:flutter/material.dart';
class Storage extends StatefulWidget {
  String? storage;
   Storage({Key? key,this.storage}) : super(key: key);

  @override
  State<Storage> createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),

          onPressed: () {

            Navigator.pop(context);
          },


        ),
        centerTitle: true,

        title: const Center(child: Text('STORAGE',style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff3B3B6B),

      ),

      body:  Padding(
        padding: EdgeInsets.all(16),
        child: SelectableText(
          widget.storage.toString(),

          style: TextStyle(fontSize: 24),

        ),
      ),

    );
  }
}

