import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';
import 'Toast message.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController Email = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Center(
            child: Text(
              'Forgot Password',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          TextField(
            controller: Email,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r)),
                prefixIcon: Icon(Icons.search),
                labelText: "Email"),
          ),
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                auth.sendPasswordResetEmail(email: Email.text).then((value) {
                  ToastMessage()
                      .toastmessage(message: 'password changed successfully');
                  Navigator.of(context)
                      .pop(MaterialPageRoute(builder: (_) => Screen1()));
                }).onError((error, stackTrace) {
                  ToastMessage().toastmessage(message: error.toString());
                });
              },
              child: Container(
                width: 184,
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
                  child: Text(
                    'Reset',
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
          ),
        ],
      ),
    );
  }
}
