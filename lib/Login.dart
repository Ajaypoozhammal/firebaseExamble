import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Forgot.dart';
import 'Singnup.dart';
import 'Home.dart';
import 'Toast message.dart';
import 'phone.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 64.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              TextField(controller: Email
                , style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r)),
                    prefixIcon: Icon(Icons.search),
                    labelText: "Email"),
              ),
              SizedBox(height: 20.h),
              TextField(controller: Password
                , style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r)),
                    prefixIcon: Icon(Icons.search),
                    labelText: "Password"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: TextButton(onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Screen2()));
                },
                  child: Text(
                    'Forgot  your password?',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 20),
                child: Row(
                  children: [
                    GestureDetector(onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Screen5()));
                    },
                      child: Icon(
                        Icons.phone,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 40.w,),
                    Icon(
                      Icons.g_mobiledata_outlined,
                      size: 60.sp,
                      color: Colors.white,
                    ),
                  ],
                ),
              ), SizedBox(height: 30.h,),
              GestureDetector(onTap: () {
                auth
                    .signInWithEmailAndPassword(
                    email: Email.text, password: Password.text)
                    .then((value) =>
                {
                  ToastMessage().toastmessage(
                      message: 'Successfully Login'),
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Screen4()))
                },)

                    .onError((error, stackTrace) => ToastMessage()
                    .toastmessage(message: error.toString(
                )
                )
                );
              },
                child: Container(
                  width: 254,
                  height: 48,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  decoration: ShapeDecoration(
                    color: Color(0xFF8204FF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF8204FF)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Screen3()));
                },
                child: Text(
                  'Don’t have an account?Sign up ',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
