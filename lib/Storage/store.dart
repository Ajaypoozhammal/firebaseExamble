import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/Storage/result.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(title: Text("Storage"),),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(color: Colors.black),
            ),
          ),SizedBox(height: 30.h,),
          GestureDetector(onTap: (){},
            child: Container(
              width: 154,
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
                  'Upload',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          GestureDetector(onTap: (){},
            child: Container(
              width: 154,
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
                child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder:(_)=>Result()));},
                  child: Text(
                    'Result',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
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
