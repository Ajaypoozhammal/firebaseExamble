

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/Toast%20message.dart';

class Screen11 extends StatefulWidget {
  const Screen11({super.key});

  @override
  State<Screen11> createState() => _Screen11State();
}

class _Screen11State extends State<Screen11> {
  TextEditingController add = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection('Data');


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "fire Store add",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500)),
        ),
      ),
      body: Column(
        children: [
          TextField(
              controller: add,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  prefixIcon: Icon(Icons.search))),
          SizedBox(
            height: 50.h,
          ),
          GestureDetector(
              onTap: () {
                final id = DateTime.now().microsecondsSinceEpoch.toString();
                firestore.doc(id).set(
                    {"id": id, "title": add.text.toString()}).then((value) {
                  ToastMessage().toastmessage(message: 'post added');
                  add.clear();
                });
              },
              child: Container(
                  width: 104,
                  height: 38,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: ShapeDecoration(
                    color: Color(0xFF8204FF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF8204FF)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                      child: Text('Add',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )))))
        ],
      ),
    );
  }
}
