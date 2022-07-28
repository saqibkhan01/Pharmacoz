
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pharmacoz_fyp/Widgets/brand_widget.dart';
import 'package:pharmacoz_fyp/Widgets/disease_widget.dart';

import 'package:pharmacoz_fyp/Widgets/scanner_widget.dart';

import 'package:pharmacoz_fyp/pages/add_brand.dart';

import 'admin_insert_data_screen.dart';






class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),

      // For Background Colour
      body: Container(

        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Back.jpeg'),
              fit: BoxFit.cover,
            )
        ),



        child: Container(
          margin: const EdgeInsets.only(bottom: 140),
          child: Center(

            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                //For Logo Pic
                //images/FrontLogo.jpeg



                SizedBox(


                    height: 110,
                    child: Image.asset(
                      "images/Logopic.png",
                      fit: BoxFit.contain,
                    )),





                //For Row Buttons

                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Center(

                    child: Row(

                      mainAxisSize: MainAxisSize.min,
                       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget> [

                        BrandButton() ,


                        DiseaseButton(),
                        ScanerButton()

                      ],

                    ),
                  ),
                ),



              ],
            ),

          ),

        ),
      ),

      // For Side Menu

      drawer: Drawer(
        backgroundColor: Color(0xff3B3B6B),

        child: ListView(

          padding: EdgeInsets.zero,
          children: [

            const DrawerHeader(child: null,

              decoration: BoxDecoration(

                image: DecorationImage(image: AssetImage('images/B_Header.jpeg'),
                    fit: BoxFit.cover),
                
           borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                border: Border(bottom: BorderSide(color: Colors.black)),

              ),
            ),
            ListTile(


                title: const Text('Home', style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.home,color: Colors.white),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(20.0),
                ),

                onTap: () {
                 Navigator.pop(context);
                }
            ),
            ListTile(

              title: const Text('Add Brand',style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.add,color: Colors.white),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(20.0),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return  const HomePage();


                }
                )
                );


              },

            ),

            ListTile(

              title: const Text('Admin',style: TextStyle(color: Colors.white    ,fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.admin_panel_settings,color: Colors.white),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(20.0),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return  const InsertScreen();


                }
                )
                );


              },

            ),




          ],
        ),
      ),

    );
  }
}





