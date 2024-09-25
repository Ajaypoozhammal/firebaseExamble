import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Toast message.dart';
import 'FireStore Add.dart';

class Screen10 extends StatefulWidget {
  const Screen10({super.key});

  @override
  State<Screen10> createState() => _Screen10State();
}

class _Screen10State extends State<Screen10> {
  final firestore = FirebaseFirestore.instance.collection('Data').snapshots();
  final ref = FirebaseFirestore.instance.collection('Data');
  TextEditingController editpost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future opendailoge(
        {required int index,
        required String id,
        required AsyncSnapshot<QuerySnapshot> snapshot}) async {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Edit Here'),
          content: TextFormField(
            controller: editpost,
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                filled: true,
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                fillColor: Color(0xFFF7F8F9),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)),
                hintText: 'Type here',
                hintStyle:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
                labelStyle: GoogleFonts.poppins(
                  color: Color(0xFF7C7C7C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                )),
            validator: (email) {
              if (email!.isEmpty) {
                return 'Enter something';
              }
              return null;
            },
          ),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black)),
                onPressed: () {
                  ref
                      .doc(snapshot!.data!.docs[index]['id'].toString())
                      .update({"title": editpost.text})
                      .then(
                        (value) => {
                          ToastMessage()
                              .toastmessage(message: "Edit Succesfully"),
                          editpost.clear(),
                          Navigator.pop(context)
                        },
                      )
                      .onError(
                        (error, stackTrace) => ToastMessage()
                            .toastmessage(message: error.toString()),
                      );
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fire store",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500)),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Screen11()));
        },
        child: Container(
          width: 104,
          height: 58,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: ShapeDecoration(
            color: Colors.brown,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF8204FF)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              '+',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error"));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text("${index + 1}"),
                        title: Text(
                            snapshot.data!.docs[index]['title'].toString()),
                        trailing: Wrap(
                          children: [
                            GestureDetector(
                              onTap: () {
                                opendailoge(index: index, id:snapshot.data!.docs[index]["id"].toString(), snapshot:snapshot);
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                ref.doc(snapshot.data!.docs[index]["id"].toString()).delete();
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
