import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/phone.dart';

import 'Login.dart';
import 'Home.dart';
import 'Toast message.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {

  TextEditingController Email=TextEditingController();
  TextEditingController Password=TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,leading: GestureDetector(onTap: () {  Navigator.pop(context);  }
          ,child: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Text(
              'Sign Up',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 50.h,),
            TextField(style:TextStyle(color: Colors.white) ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  prefixIcon: Icon(Icons.search),
                  labelText: "UserName"),
            ),
            SizedBox(height: 20.h,),
            TextField(controller: Email,
              style:TextStyle(color: Colors.white) ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  prefixIcon: Icon(Icons.search),
                  labelText: "Email"),
            ),
            SizedBox(height: 20.h,),
            TextField(controller: Password,
              style:TextStyle(color: Colors.white) ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  prefixIcon: Icon(Icons.search),
                  labelText: "Password"),
            ),
            SizedBox(height: 20.h,),
            TextField(style:TextStyle(color: Colors.white) ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  prefixIcon: Icon(Icons.search),
                  labelText: "Mobile"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120,top: 20),
              child: Row(
                children: [
                  GestureDetector(onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen5())); },
                    child: Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.g_mobiledata,
                    size: 40,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            GestureDetector(onTap: () { auth
                .createUserWithEmailAndPassword(
                email: Email.text, password: Password.text)
                .then((value) => {
              ToastMessage().toastmessage(message: 'Successfully registerd'),
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Screen4()))
            })
                .onError((error, stackTrace) => ToastMessage()
                .toastmessage(message: error.toString())); },
              child: Container(
                width: 244,
                height: 48,
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
                    'Sign Up',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen1())); },
              child: Text(
                'Don’t have an account?Login ',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
