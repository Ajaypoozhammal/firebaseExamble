//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FireStore Add.dart';

class Screen10 extends StatefulWidget {
  const Screen10({super.key});

  @override
  State<Screen10> createState() => _Screen10State();
}

class _Screen10State extends State<Screen10> {


  @override
  Widget build(BuildContext context) {
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

    );
  }
}
