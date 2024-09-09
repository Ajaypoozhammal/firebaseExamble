import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'OTP.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,leading: GestureDetector(onTap: () { Navigator.pop(context); },child: Icon(Icons.arrow_back,color: Colors.white,)),
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
          TextField(style:TextStyle(color: Colors.white) ,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r)),
                prefixIcon: Icon(Icons.search),
                labelText: "Phone Number"),
          ),
          SizedBox(height: 50.h,),
          Center(
            child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen7()));},
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
            ),
          ),
        ],
      ),
    );
  }
}
