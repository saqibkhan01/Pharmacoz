import 'package:flutter/material.dart';

import '../drugsinfoWidgets/overview_widgets.dart';
import '../drugsinfoWidgets/risk_widgets.dart';
import '../drugsinfoWidgets/side_effect_widgets.dart';
import '../drugsinfoWidgets/storage_widgets.dart';
import '../drugsinfoWidgets/warning_widgets.dart';
class DrugInformation extends StatefulWidget {
  String? name;
  String? risk;
  String? overview;
  String? storage;
  String? side;
  String? warning;
  DrugInformation({Key? key,this.name,this.overview,this.storage,this.risk,this.side,this.warning}) : super(key: key);

  @override
  State<DrugInformation> createState() => _DrugInformationState();
}

class _DrugInformationState extends State<DrugInformation> {
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

        title:  Center(child: Text(widget.name.toString(),style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff3B3B6B),


      ),
      body: Container(
        child: ListView(

          padding: EdgeInsets.zero,
          children: [

        Card(
          color: Colors.blueGrey.shade100,
            child: ListTile(

                title: const Text('OVERVIEW', style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.chevron_right),

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return   Overview(overview: widget.overview,);


                  }
                  )
                  );

                }
            ),
        ),

    Card(
      color: Colors.blueGrey.shade100,
            child: ListTile(

              title: const Text('SIDE EFFECT',style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return   SideEffect(side: widget.side,);


                }
                )
                );


              },

            ),

    ),
    Card(
      color: Colors.blueGrey.shade100,
            child: ListTile(

              title: const Text('RISK',style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return   Risk(risk: widget.risk,);


                }
                )
                );

              },

            ),

    ),

      Card(
        color: Colors.blueGrey.shade100,
            child: ListTile(

              title: const Text('WARNING',style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return   Warning(warning: widget.warning,);


                }
                )
                );

              },

            ),
      ),
      Card(
        color: Colors.blueGrey.shade100,
            child: ListTile(

              title: const Text('STORAGE',style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return   Storage(storage: widget.storage,);


                }
                )
                );

              },

            ),
      ),



          ],
        ),
      )
    );
  }
}
