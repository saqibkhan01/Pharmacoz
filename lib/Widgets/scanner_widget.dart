import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacoz_fyp/pages/image_text_scanner.dart';


class ScanerButton extends StatefulWidget {
  const ScanerButton({Key? key}) : super(key: key);

  @override
  _ScanerButtonState createState() => _ScanerButtonState();
}

class _ScanerButtonState extends State<ScanerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context){
         return  const ImageScanner();


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
                fontSize: 12,fontWeight: FontWeight.bold
            )
        ),

        child: SizedBox(

          width: 67,
          height: 45,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text("Text Scaner",style: TextStyle(color: Colors.white),)],
          ),
        ),
      ),
    );
  }
}
