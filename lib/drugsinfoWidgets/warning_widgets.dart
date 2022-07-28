import 'package:flutter/material.dart';
class Warning extends StatefulWidget {
  String? warning;
   Warning({Key? key,this.warning}) : super(key: key);

  @override
  State<Warning> createState() => _WarningState();
}

class _WarningState extends State<Warning> {
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

        title: const Center(child: Text('WARNING',style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff3B3B6B),

      ),

      body:  Padding(
        padding: EdgeInsets.all(16),
        child: SelectableText(
          widget.warning.toString(),

          style: TextStyle(fontSize: 24),

        ),
      ),

    );
  }
}
