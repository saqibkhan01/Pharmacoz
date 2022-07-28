import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacoz_fyp/drugsinfoWidgets/storage_widgets.dart';

import '../DiseaseInfoWidget/disease_overview.dart';
import '../DiseaseInfoWidget/disease_risk.dart';
import '../DiseaseInfoWidget/disease_sideeffect.dart';
import '../DiseaseInfoWidget/disease_storage.dart';
import '../DiseaseInfoWidget/disease_warning.dart';
import '../drugsinfoWidgets/overview_widgets.dart';
import '../drugsinfoWidgets/risk_widgets.dart';
import '../drugsinfoWidgets/side_effect_widgets.dart';
import '../drugsinfoWidgets/warning_widgets.dart';
import '../pages/brand_screen.dart';

class Dinformation extends StatefulWidget {
  final DocumentSnapshot post;
  Dinformation({required this.post});

  @override
  State<Dinformation> createState() => _DinformationState();
}

class _DinformationState extends State<Dinformation> {
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
          title: Center(
              child: Text(
            widget.post['dname'],
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Color(0xff3B3B6B),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Card(
                elevation: 20,
                color: Colors.blueGrey.shade300,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: ListTile(
                  title: const Center(
                      child:  Text('Related Medicines',
                          style: TextStyle(fontWeight: FontWeight.bold))),

                  //title: const Text('Related Medicines',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Center(
                    child: Text(
                      widget.post['mname'],
                      style: TextStyle(color: Colors.cyanAccent),
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),


                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BrandScreen(widget.post.id)),
                    );
                  },
                ),
              ),
             /* Card(
                color: Colors.blueGrey.shade100,
                child: ListTile(
                    title: const Text('OVERVIEW',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DiseaseOverview(
                          Doverview: widget.post['Doverview'],
                        );
                      }));
                    }),
              ),
              Card(
                color: Colors.blueGrey.shade100,
                child: ListTile(
                  title: const Text('SIDE EFFECT',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DiseaseSIdeeffet(
                        Dside: widget.post['Dsideeffect'],
                      );
                    }));
                  },
                ),
              ),
              Card(
                color: Colors.blueGrey.shade100,
                child: ListTile(
                  title: const Text('RISK',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DiseaseRisk(
                        Drisk: widget.post['Drisk'],
                      );
                    }));
                  },
                ),
              ),
              Card(
                color: Colors.blueGrey.shade100,
                child: ListTile(
                  title: const Text('WARNING',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DiseaseWarning(
                        Dwarning: widget.post['Dwarning'],
                      );
                    }));
                  },
                ),
              ),
              Card(
                color: Colors.blueGrey.shade100,
                child: ListTile(
                  title: const Text('STORAGE',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DiseaseStorage(
                        Dstorage: widget.post['Dstorage'],
                      );
                    }));
                  },
                ),
              ),*/
            ],
          ),
        ));
  }
}
