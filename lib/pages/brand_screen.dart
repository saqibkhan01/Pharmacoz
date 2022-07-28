import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../damo pages/drug_infoo.dart';
import '../information-Medicine/injection_information.dart';
import '../information-Medicine/medicien_information.dart';
import '../information-Medicine/syrup_information.dart';
import '../information-Medicine/tablet_information.dart';
import 'injuction.dart';

class BrandScreen extends StatefulWidget {
  final doc;
  BrandScreen(this.doc);

  @override
  _BrandScreenClassState createState() => _BrandScreenClassState();
}

class _BrandScreenClassState extends State<BrandScreen> {
  final db = FirebaseFirestore.instance;

  //navigateToDetail(DocumentSnapshot post){
   // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicienInformation(post: post,) ));
 // }


// navigat(DocumentSnapshot post ){
   // Navigator.push(context, MaterialPageRoute(builder: (context) => InDrugInfo(post: post,) ));

 // }



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

        title: const Center(child: Text('Brand Medicines',style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff3B3B6B),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db
            .collection('admin')
            .doc(widget.doc)
            .collection('admins')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var doc = snapshot.data?.docs;

            return  ListView.builder(
                itemCount: doc?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Card(


                              child: Column(
                                children: [
                                  ListTile(


                                    leading: SizedBox(
                                      height: 100,
                                      width: 50,

                                      child: Image.asset('images/tablet.png'),
                                    ),

                                    title: Text(
                                      snapshot.data?.docs[index]['mname'], style: TextStyle(fontWeight: FontWeight.bold),),
                                    subtitle:  Text(
                                      snapshot.data?.docs[index]['mformula'],
                                      style: TextStyle(backgroundColor: Color(0xff3B3B6B),
                                          color: Colors.white),


                                    ),

                                    trailing: Icon(Icons.chevron_right),
                                    isThreeLine: true,
                                   // onTap: () => navigateToDetail(snapshot.data!.docs[index]),
                                      onTap: () {

                                        Navigator.push(context,MaterialPageRoute(builder: (context ) => TabletInformation(doc: widget.doc )));

                                      }
                                  ),

                                ],
                              ),
                            ),










                            Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: SizedBox(
                                      height: 100,
                                      width: 50,
                                      child: Image.asset('images/injectionn.png'),
                                    ),


                                    title:  Text(
                                      snapshot.data?.docs[index]['mname'], style: TextStyle(fontWeight: FontWeight.bold),),
                                    subtitle:  Text(
                                      snapshot.data?.docs[index]['mformula'],
                                      style: TextStyle(backgroundColor: Color(0xff3B3B6B),
                                          color: Colors.white),
                                    ),
                                    trailing: Icon(Icons.chevron_right),
                                    isThreeLine: true,
                                     onTap: () {

                                     Navigator.push(context,MaterialPageRoute(builder: (context ) => InjectionInformation(doc: widget.doc )));

                                      }

                                  ),

                                ],
                              ),



                            ),












                            Card(

                              child: Column(
                                children: [
                                  ListTile(
                                    leading: SizedBox(
                                      height: 100,
                                      width: 50,

                                      child: Image.asset('images/syrupp.png'),
                                    ),

                                    title: Text(
                                      snapshot.data?.docs[index]['mname'], style: TextStyle(fontWeight: FontWeight.bold),),
                                    subtitle:  Text(
                                      snapshot.data?.docs[index]['mformula'], style: TextStyle(
                                        backgroundColor: Color(0xff3B3B6B), color: Colors.white),
                                    ),

                                    trailing: Icon(Icons.chevron_right),
                                    isThreeLine: true,
                                      onTap: () { //navigat(snapshot.data!.docs[index]);

                                        Navigator.push(context,MaterialPageRoute(builder: (context ) => SyrupInformation(doc: widget.doc )));

                                      }
                                  ),

                                ],
                              ),
                            ),





                             // dense: true,
                             // contentPadding: EdgeInsets.only(left: 85.0,right: 0.0),








                          ],
                        ),


                      ),


                  //  ),
                  );
                });
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}