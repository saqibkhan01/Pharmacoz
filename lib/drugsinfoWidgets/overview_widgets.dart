
import 'package:flutter/material.dart';
class Overview extends StatefulWidget {
  String? overview;
 Overview({Key? key, this.overview}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
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
        title: const Center(child: Text('OVERVIEW',style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff3B3B6B),

      ),

      body:  Container(
        padding: EdgeInsets.all(20),
        child: SelectableText( widget.overview.toString()
         ,

          style: TextStyle(fontSize: 24),

        ),



      ),



    );
  }
}
