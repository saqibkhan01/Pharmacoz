import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/search_for_brand.dart';


class BrandButton extends StatefulWidget {
  const BrandButton({Key? key}) : super(key: key);

  @override
  _BrandButtonState createState() => _BrandButtonState();
}

class _BrandButtonState extends State<BrandButton> {
  @override
  Widget build(BuildContext context) {
    return Container(


      margin: const EdgeInsets.all(5.0),
      child: ElevatedButton(
               
          
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return  const SearchMedicine();


          }
          )
          );
        },

        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            primary:   Color(0xFF9E9E9E),
            



            textStyle: const TextStyle(
                fontSize:12,fontWeight: FontWeight.bold
            )
        ),




        child: SizedBox(

          width: 67,
          height: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text(" Medicine ",style: TextStyle(color: Colors.white),)],
          ),
        ),
      ),
    );


  }
}
