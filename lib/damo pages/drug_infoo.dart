import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../information-Medicine/drug_information.dart';
class InDrugInfo extends StatefulWidget {
 // const InDrugInfo({Key? key}) : super(key: key);
  final DocumentSnapshot post;
  InDrugInfo({required this.post});

  @override
  State<InDrugInfo> createState() => _InDrugInfoState();
}

class _InDrugInfoState extends State<InDrugInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: ()
             => Navigator.pop(context)

          ),
          title: Center(
              child: Text(
                widget.post['mname'],
                style: TextStyle(color: Colors.white),
              )),
          backgroundColor: Color(0xff3B3B6B),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
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
                    widget.post['rdrug'],
                  ),
                  trailing: Icon(Icons.chevron_right),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DrugInformation(
                            name: widget.post['rdrug'],
                            warning: widget.post['warning'],
                            side: widget.post['sideeffect'],
                            overview: widget.post['overview'],
                            risk: widget.post['risk'],
                            storage: widget.post['storage'],
                          );
                        })

                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
