import 'package:flutter/material.dart';
class Risk extends StatefulWidget {
  String? risk;
   Risk({Key? key, this.risk}) : super(key: key);

  @override
  State<Risk> createState() => _RiskState();
}

class _RiskState extends State<Risk> {
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

        title: const Center(child: Text('RISK',style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff3B3B6B),

      ),

      body:  Padding(
        padding: EdgeInsets.all(16),
        child: SelectableText(
          widget.risk.toString() ,textAlign: TextAlign.justify,

          style: TextStyle(fontSize: 24),

        ),
      ),

    );
  }
}
