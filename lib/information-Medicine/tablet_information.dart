import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drug_information.dart';
class TabletInformation extends StatefulWidget {

  final doc;
  final mname;
  //final DocumentSnapshot post;

  TabletInformation({Key? key, this.doc, this.mname
    /*required this.post*/
  })
      : super(key: key);

  @override
  State<TabletInformation> createState() => _TabletInformationState();
}

class _TabletInformationState extends State<TabletInformation> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseFirestore.instance
        .collection("admin")
        .doc(widget.doc)
        .collection("admins")
        .where('tablet', isEqualTo: true)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3B3B6B),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: StreamBuilder<QuerySnapshot>(
          stream: user,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

            if (snapshot.hasError) {
              return Container(
                child: Center(child: Text('ther is No data')),
              );
            }


            else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }




            else {
              final List postDetail = [];
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map data = document.data() as Map<String, dynamic>;
                postDetail.add(data);
                //data['id'] = document.id;
              }).toList();

              return Column(
                children: [
                  for (int i = 0; i < postDetail.length; i++) ...[
                    Center(
                        child: Text(
                          postDetail[i]['mname'].toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ]
                ],
              );
            }
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: user,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                    if (snapshot.hasError) {
                      return Container(
                        child: Center(child: Text('There is an  error',style: TextStyle(fontWeight: FontWeight.bold),)),
                      );
                    }

                     else if(!snapshot.hasData){
                       return Center(child: Text('THERE IS NO DATA  ',style: TextStyle(fontWeight: FontWeight.bold,backgroundColor: Colors.red),));
                     }



                    else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }



                    else {
                      final List postDetail = [];
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map data = document.data() as Map<String, dynamic>;
                        postDetail.add(data);
                        //data['id'] = document.id;
                      }).toList();
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < postDetail.length; i++) ...[
                            Card(
                              color: Colors.blueGrey.shade100,
                              child: ListTile(
                                leading: SizedBox(
                                  height: 100,
                                  width: 50,
                                  child: Image.asset('images/drugs.png'),
                                ),
                                title: const Text(
                                  'DRUGS INCLUDED',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Color(0xff3B3B6B),
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  postDetail[i]['rdrug'],
                                ),
                                trailing: Icon(Icons.chevron_right),
                                isThreeLine: true,
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return DrugInformation(
                                          name: postDetail[i]['mname'],
                                          warning: postDetail[i]['warning'],
                                          side: postDetail[i]['sideeffect'],
                                          overview: postDetail[i]['overview'],
                                          risk: postDetail[i]['risk'],
                                          storage: postDetail[i]['storage'],
                                        );
                                      }));
                                },
                              ),
                            ),





                            Card(


                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      postDetail[i]['tabprice'], style: TextStyle(fontWeight: FontWeight.bold),),
                                    subtitle:  Text(
                                      postDetail[i]['tabmg'],
                                      style: TextStyle(backgroundColor: Color(0xff3B3B6B),
                                          color: Colors.white),
                                    ),
                                    isThreeLine: true,
                                  ),
                                ],
                              ),
                            ),










                            // GestureDetector(
                            // onTap: (){
                            // navigateToDetail(snapshot.data!.docs[i]);

                            // },child:  Text("hiigiygiguguugiygufufufiutyf"),
                            // ),
                          ]
                        ],
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

