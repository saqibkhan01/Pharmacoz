import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacoz_fyp/damo%20pages/second_pages.dart';
import 'package:pharmacoz_fyp/pages/subcat.dart';
class First_Pages extends StatefulWidget {
  //const First_Pages({Key? key}) : super(key: key);

  final DocumentSnapshot post;
  First_Pages({required this.post});

  @override
  State<First_Pages> createState() => _First_PagesState();
}

class _First_PagesState extends State<First_Pages> {
  final db = FirebaseFirestore.instance;

  //navigateToDetail(DocumentSnapshot post){
   // Navigator.push(context, MaterialPageRoute(builder: (context) => Second_Pages(post: post,) ));
 // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        onTap: () {
                          //print(doc[index].documentID);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Second_Pages(doc![index].id)),
                          );
                        },
                        //=> navigateToDetail(snapshot.data!.docs[index]),
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
                              Card(


                                child: ListTile(


                                  title: Text(
                                    widget.post['name'], style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle:  Text(
                                      widget.post['detail'],
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


