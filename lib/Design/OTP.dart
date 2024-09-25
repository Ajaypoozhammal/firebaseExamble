import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/Design/Home.dart';

import 'Login.dart';
import '../Toast message.dart';

class Screen7 extends StatefulWidget {
  final String otp;

  const Screen7({super.key, required this.otp});

  @override
  State<Screen7> createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  TextEditingController Otp = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, leading: GestureDetector(onTap: () {
        Navigator.pop(context);
      }, child: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
          Text(
          "OTP",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 34.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 150.h,),
        OtpTextField(

          numberOfFields: 5,
          borderColor: Color(0xFF512DA8),
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                }
            );
          }, // end onSubmit
        ),
        SizedBox(height: 30.h,),

        GestureDetector(onTap: () async {
          final credentials = PhoneAuthProvider.credential(
              verificationId: widget.otp,
              smsCode: Otp.text);
          try{
            await auth.signInWithCredential(credentials);
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>Screen4()));
          }catch(e){
            ToastMessage().toastmessage(message: e.toString());
          }
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
    )],
    )
    ,
    )
    ,
    );
  }
}
