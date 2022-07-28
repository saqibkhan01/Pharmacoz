


import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class ImageScanner extends StatefulWidget {
  const ImageScanner({Key? key}) : super(key: key);

  @override
  _ImageScannerState createState() => _ImageScannerState();
}



class _ImageScannerState extends State<ImageScanner> {



  String result = '';
  File? image;
  ImagePicker? imagePicker;


  pickImageFromGallery()async
  {
    XFile? pickedFile = await imagePicker!.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    setState(() {
      image;
      performImageLabeling();
    });


  }
  pickImageFromCamera()async
  {
    XFile? pickedFile = await imagePicker!.pickImage(source: ImageSource.camera);
    image = File(pickedFile!.path);
    setState(() {
      image;
      performImageLabeling();
    });


  }

  performImageLabeling()async
  {
    final FirebaseVisionImage firebaseVisionImage = FirebaseVisionImage.fromFile(image!);
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await recognizer.processImage(firebaseVisionImage);
    result = '';

    setState(() {
      for(TextBlock block in visionText.blocks)
      {
        final String? txt = block.text;
        for(TextLine line in block.lines){
          for(TextElement element in line.elements)
          {
            result += element.text!+"";
          }
        }
        result += "\n\n" ;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }








  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff3B3B6B),
        centerTitle: true,
        title: Text('Text Scaner',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),

          onPressed: () {

            Navigator.pop(context);
          },


        ),
        actions: [
          IconButton(
            icon: Icon(Icons.copy, color: Colors.white),

            onPressed: () {

              Clipboard.setData(ClipboardData(text: result));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "Text Copied",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                ),

              ));
            },


          ),
        ],

      ),



      body: Container(


        decoration:  const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Back.jpeg'),fit: BoxFit.cover
            )
        ),






        child: Column(
          children:  [


           // const SizedBox(width: 100,),

            Container(

              height: 280,
              width: 250,
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.only(left: 28,bottom: 5,right: 18),
              child: SingleChildScrollView(

                child: Padding(
                  padding: const EdgeInsets.all(12),

                  child: SelectableText(





                    result  ,




                     // controller: detailController,


                    style: const TextStyle(color: Colors.white  ,fontSize: 16),
                    textAlign: TextAlign.justify,
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      selectAll: true,


                    ),
                  ),
                ),
              ),

             decoration: const BoxDecoration(
                color: Colors.black54,


              ),


            ),


            Container(
              margin: const EdgeInsets.only(top: 20,right: 70,left: 70),
              child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(

                            height: 240,
                            width: 250,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                ),
                        ),
                      ],
                    ),

                    Center(
                      child: TextButton(
                        onPressed: ()
                        {

                          pickImageFromGallery();

                        },
                        onLongPress: (){

                          pickImageFromCamera();
                        },
                        child: Container(
                            margin: const EdgeInsets.only(top: 25),
                            child: image != null?
                            Image.file(image!,width: 140,height: 192,fit: BoxFit.fill,)
                                :Container(
                              width: 240,
                              height: 200,
                              child: const Icon(Icons.camera_enhance_sharp, size: 100),

                            )

                        ),

                      ),
                    )
                  ]
              ),
            )



          ],
        ),



      ),


    );
  }





}
