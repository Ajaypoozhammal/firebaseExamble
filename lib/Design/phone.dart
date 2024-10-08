import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'OTP.dart';
import '../Toast message.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  TextEditingController Phone = TextEditingController();
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
          Text(
            "Phone",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 34.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          TextField(
            controller: Phone,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r)),
                prefix:Text('+91 '),
                hintText:"phone number",hintStyle: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                auth.verifyPhoneNumber(
                    phoneNumber: "+91${Phone.text}",
                    verificationCompleted: (_) {},
                    verificationFailed: (e) {
                      ToastMessage().toastmessage(message: e.toString());
                    },
                    codeSent: (String verificationId, int? token) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => Screen7(
                                otp: verificationId,
                              )));
                    },
                    codeAutoRetrievalTimeout: (e) {
                      ToastMessage().toastmessage(message: e.toString());
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
                  child: Text(
                    'Verify',
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
