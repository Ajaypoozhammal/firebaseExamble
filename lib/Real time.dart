import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Real time Add.dart';

class Screen8 extends StatefulWidget {
  const Screen8({super.key});

  @override
  State<Screen8> createState() => _Screen8State();
}

class _Screen8State extends State<Screen8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Screen9()));},
        child: Container(
          width: 104,
          height: 58,
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}"),
                  title: Text("salih"),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
