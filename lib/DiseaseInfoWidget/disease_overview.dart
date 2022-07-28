
/*import 'package:flutter/material.dart';
class DiseaseOverview extends StatefulWidget {

  String? Doverview;



   DiseaseOverview({Key? key,this.Doverview}) : super(key: key);

  @override
  State<DiseaseOverview> createState() => _DiseaseOverviewState();
}

class _DiseaseOverviewState extends State<DiseaseOverview> {
  @override
  Widget build(BuildContext context)  {
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
        child: SelectableText( widget.Doverview.toString()
          ,

          style: TextStyle(fontSize: 24),

        ),



      ),



    );
  }
}

*/