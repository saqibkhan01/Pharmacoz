
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../information-Medicine/drug_information.dart';


class Returnss extends StatefulWidget {
  final doc;

  // Subpages({Key? key}) : super(key: key);
  Returnss(this.doc);

  @override
  _ReturnssClassState createState() => _ReturnssClassState();
}

class _ReturnssClassState extends State<Returnss> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),

          onPressed: () {
            Navigator.pop(context);


          },


        ),

        title: const Center(child: Text('Brand Medicines')),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db
            .collection('asif').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var doc = snapshot.data?.docs;

            return  ListView.builder(
                itemCount: doc?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  GestureDetector(
                      onTap: () {
                        // print(doc[index].documentID);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DrugInformation()),
                        );
                      },

                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Card(


                              child: ListTile(


                                leading: SizedBox(
                                  height: 100,
                                  width: 50,

                                  child: Image.asset('images/tablet.png'),
                                ),

                                title: Text(
                                  snapshot.data?.docs[index]['mname'], style: TextStyle(fontWeight: FontWeight.bold),),
                                subtitle:  Text(
                                  snapshot.data?.docs[index]['mdose'],
                                  style: TextStyle(backgroundColor: Color(0xff01579B),
                                      color: Colors.white),


                                ),

                                trailing: Icon(Icons.chevron_right),
                                isThreeLine: true,

                              ),
                            ),










                          ],
                        ),


                      ),


                    ),
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
*/