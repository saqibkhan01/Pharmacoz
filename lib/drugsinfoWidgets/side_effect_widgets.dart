import 'package:flutter/material.dart';
class SideEffect extends StatefulWidget {
  String? side;
   SideEffect({Key? key,this.side}) : super(key: key);

  @override
  State<SideEffect> createState() => _SideEffectState();
}

class _SideEffectState extends State<SideEffect> {
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
        title: const Center(child: Text('Side Effect',style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff3B3B6B),

      ),

      body:  Padding(
        padding: EdgeInsets.all(16),
        child: SelectableText(widget.side.toString()
          ,

          style: TextStyle(fontSize: 24),

        ),
      ),

    );
  }
}
