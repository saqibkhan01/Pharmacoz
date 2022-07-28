import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/insert_data_model.dart';
class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {





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

        title: const Center(child: Text('Admin Insert Data',style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff3B3B6B),
      ),
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

                    margin: EdgeInsets.fromLTRB(5, 150, 5, 120),


                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        MaterialButton(
                          onPressed:() {


                            InsertDataModel().insertData();

                            final text = 'Admin Data Register Successfully';
                            final snackBar = SnackBar(content: Text(text));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);


                          },
                          child: const Text("Admin Insert Data"),
                          color: Color(0xff3B3B6B),
                          textColor: Colors.white,
                          minWidth: 300,
                          height: 45,
                        ),
                      ],
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
