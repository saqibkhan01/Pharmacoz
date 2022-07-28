import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacoz_fyp/pages/home_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(



      body: Container(

        decoration:   const BoxDecoration(

            image: DecorationImage(image: AssetImage('images/Back.jpeg'),


                fit: BoxFit.cover)

        ),


        child: Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: Center(

            child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  SizedBox(


                      height: 150,
                      child: Image.asset(
                        "images/Logopic.png",
                        fit: BoxFit.contain,
                      )),

                  Container(
                    width: 300,
                      height: 60,
                    //  padding: EdgeInsets.all(20),

                    margin: EdgeInsets.fromLTRB(5, 300, 5, 5),


                    child: ElevatedButton(

                      //  minWidth: MediaQuery.of(context).size.width,
                        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context){
                          return  const Homescreen();


                        }
                        )
                        );
                        },

                      child:  const Text(
                          "Tap To Continue ... ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),

                      style: ElevatedButton.styleFrom(
                         primary:Color(0xff3B3B6B),

                      ),


                    ),
                  )







                ]
            ) ,

          ),
        ),
      ),

    );

  }
}

