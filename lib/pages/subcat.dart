
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacoz_fyp/pages/subcatogory.dart';

import '../damo pages/first_pages.dart';



class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final db = FirebaseFirestore.instance;
  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => First_Pages(post: post,) ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: db.collection('user').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var doc = snapshot.data?.docs;
              return ListView.builder(
                  itemCount: doc?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => navigateToDetail(snapshot.data!.docs[index]),
                        //{

                          //print(doc[index].documentID);
                        //  Navigator.push(
                          //  context,
                           // MaterialPageRoute(
                               // builder: (context) =>
                                  //  Subpages(doc![index].id)),
                          //);
                      // },
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Text(snapshot.data?.docs[index]['name']),
                              SizedBox(
                                height: 10.0,
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  );
            } else {
              return LinearProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

*/