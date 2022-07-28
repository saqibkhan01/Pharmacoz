import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  var name = '';
  var form = '';
  var company = '';
  var drugs = '';
  var price = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController formController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController drugsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  postData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    ModelData modelData = ModelData();

    modelData.name = nameController.text;
    modelData.form = formController.text;
    modelData.company = companyController.text;
    modelData.drugs = drugsController.text;
    modelData.price = int.tryParse(priceController.text);

    await firebaseFirestore
        .collection('User')
        .doc(user?.uid)
        .set(modelData.toMap());

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "Medicine Register Successfully",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
      ),
      backgroundColor: Colors.grey,
    ));
  }

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

        title: const Center(child: Text('ADD BRAND',style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xff3B3B6B),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: nameController,
                  style: const TextStyle(color: Color(0xff333333)),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: const Color(0xffefefef),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                        color: Color(0xffafafaf), fontSize: 15),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your Name";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child:TextFormField(
                  controller: formController,
                  style: const TextStyle(color: Color(0xff333333)),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: const Color(0xffefefef),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Form',
                    hintStyle: const TextStyle(
                        color: Color(0xffafafaf), fontSize: 15),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your Form";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: companyController,
                  style: const TextStyle(color: Color(0xff333333)),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: const Color(0xffefefef),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Company',
                    hintStyle: const TextStyle(
                        color: Color(0xffafafaf), fontSize: 15),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your Company";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: drugsController,
                  style: const TextStyle(color: Color(0xff333333)),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: const Color(0xffefefef),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Drugs',
                    hintStyle: const TextStyle(
                        color: Color(0xffafafaf), fontSize: 15),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your Drugs";
                    }
                    return null;
                  },
                ),
              ),


              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: priceController,
                  style: const TextStyle(color: Color(0xff333333)),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: const Color(0xffefefef),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Price',
                    hintStyle: const TextStyle(
                        color: Color(0xffafafaf), fontSize: 15),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your Price";
                    }
                    return null;
                  },
                ),
              ),








              const SizedBox(
                height: 50,
              ),

              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      name = nameController.text;
                      form = formController.text;
                      company = companyController.text;
                      drugs = drugsController.text;
                      price = priceController.text;
                    });
                    postData();
                  }
                },
                child: Container(

                  alignment: Alignment.center,

                  height: 45,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Color(0xff3B3B6B),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("Submite",style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}