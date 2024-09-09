import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green,
      appBar:AppBar(
        backgroundColor: Colors.black,leading: GestureDetector(onTap: () { Navigator.pop(context); },child: Icon(Icons.arrow_back,color: Colors.white,)),
      ),);
  }
}
