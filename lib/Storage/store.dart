import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled3/Storage/result.dart';

import '../Toast message.dart';



class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  File? image;
  final picker=ImagePicker();
  final firestore=FirebaseFirestore.instance.collection("files");
  Future<void>getimage()async{
    final pickedFile =await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
  setState(() {
    if(pickedFile!=null)
{
  image=File(pickedFile.path);

}    else{}
  });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                getimage();



              },
              child: Container(
                  height: 200,
                  width: 200,
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
                  child: image != null
                      ? Image.file(image!.absolute)
                      : Center(
                    child: Icon(
                      Icons.photo,
                      size: 40,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 201, 12, 166))),
              onPressed: () async {
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    firebase_storage.Reference ref= firebase_storage.FirebaseStorage.instance
        .ref('/foldername/' + id);
    firebase_storage.UploadTask uploadTask=
    ref.putFile(image!.absolute);
    await Future.value(uploadTask).then(
    (value) async {
    var newurl = await ref.getDownloadURL();
    firestore.doc(id).set({"id": id, "title": newurl}).then(
    (value) => {
    ToastMessage()
        .toastmessage(message: 'Uploaded successfully'),
    setState(() {
    image=null;
    })

    },
    );
    },
    );
              },
              child: Text(
                'upload',
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 201, 12, 166))),
              onPressed: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Result()));
              },
              child: Text(
                'See result',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
