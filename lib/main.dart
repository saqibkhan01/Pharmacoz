import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:pharmacoz_fyp/pages/add_brand.dart';
import 'package:pharmacoz_fyp/pages/first_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print("something went wrong");
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );

          }
          return  MaterialApp(
            theme: ThemeData(

              primarySwatch: Colors.grey,

            ),
            home: FirstScreen(),
          );

        });




  }
}