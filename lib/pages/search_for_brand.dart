import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'brand_screen.dart';

class SearchMedicine extends StatefulWidget {
  const SearchMedicine({Key? key}) : super(key: key);

  @override
  State<SearchMedicine> createState() => _SearchMedicineState();
}

class _SearchMedicineState extends State<SearchMedicine> {
  String name = "";
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3B3B6B),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Card(
          child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search ',
              ),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              }),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
                .collection('admin')
                .where("searchkey", arrayContains: name)
                .snapshots()
            : FirebaseFirestore.instance.collection("admin").snapshots(),
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

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BrandScreen(doc![index].id)),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                title: Text(snapshot.data?.docs[index]['mname'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                trailing: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 30,
                                ),
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
