import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Toast message.dart';

class Screen9 extends StatefulWidget {
  const Screen9({super.key});

  @override
  State<Screen9> createState() => _Screen9State();
}

class _Screen9State extends State<Screen9> {
  final post = TextEditingController();
  final database = FirebaseDatabase.instance.ref("Data");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Real Time add",
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
            controller: post,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.r)),
              prefixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          GestureDetector(
            onTap: () {
              final id = DateTime.now().microsecondsSinceEpoch.toString();
              database
                  .child(id)
                  .set({"id": id, "title": post.text.toString()})
                  .then(
                    (value) => {
                      ToastMessage()
                          .toastmessage(message: 'adding Succesfully'),
                      post.clear()
                    },
                  )
                  .onError(
                    (error, stackTrace) =>
                        ToastMessage().toastmessage(message: error.toString()),
                  );
            },
            child: Container(
              width: 104,
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: ShapeDecoration(
                color: Color(0xFF8204FF),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF8204FF)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'Add',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
