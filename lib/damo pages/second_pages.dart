import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Second_Pages extends StatefulWidget {
 // const Second_Pages({Key? key}) : super(key: key);
  final  doc;
  Second_Pages( this.doc);
  @override
  State<Second_Pages> createState() => _Second_PagesState();
}

class _Second_PagesState extends State<Second_Pages> {
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
            .collection('user')
            .doc(widget.doc)
            .collection('users')

            .snapshots(),
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
                     //   Navigator.push(
                        //  context,
                       //   MaterialPageRoute(
                          //    builder: (context) =>
                          //        Returnss(doc![index].id)),
                     //   );
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
                                  snapshot.data?.docs[index]['dname'], style: TextStyle(fontWeight: FontWeight.bold),),
                                subtitle:  Text(
                                  snapshot.data?.docs[index]['aname'],
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
