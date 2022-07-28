import 'package:flutter/material.dart';

import '../pages/diseae_demo.dart';
import '../pages/search_for_brand.dart';
import '../pages/search_for_diseas.dart';
import '../pages/subcat.dart';

class DiseaseButton extends StatefulWidget {
  const DiseaseButton({Key? key}) : super(key: key);

  @override
  _DiseaseButtonState createState() => _DiseaseButtonState();
}

class _DiseaseButtonState extends State<DiseaseButton> {




  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context){
           return    SDisease();


          }
          )
         );
        },

        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            primary:   Color(0xFF9E9E9E),


            textStyle: TextStyle(
                fontSize: 12,fontWeight: FontWeight.bold
            )
        ),

        child: SizedBox(

          width: 67,
          height: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text("Disease",style: TextStyle(color: Colors.white),)],
          ),
        ),
      ),
    );
  }
}
