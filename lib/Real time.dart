import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Real time Add.dart';
import 'Toast message.dart';

class Screen8 extends StatefulWidget {
  const Screen8({super.key});

  @override
  State<Screen8> createState() => _Screen8State();
}

class _Screen8State extends State<Screen8> {
  final ref = FirebaseDatabase.instance.ref('Data');
TextEditingController  editpost=TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Screen9()));
        },
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
              child: StreamBuilder(
            stream: ref.onValue,
            builder: (BuildContext context,AsyncSnapshot<DatabaseEvent> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as dynamic;
                List<dynamic> list = [];
                list.clear();
                list = map.values.toList();
                return ListView.builder(
                    itemCount:snapshot.data!.snapshot.children.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text("${index + 1}"),
                        title: Text(list[index]['title']),
                        trailing: Wrap(
                          children: [
                            GestureDetector(onTap: (){
                              opendailoge(index: index, snapshot: snapshot, id:list[index]["id"].toString());
                            },
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            GestureDetector(onTap: (){ref.child(list[index]["id"]).remove();},
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
            },
          )),
        ],
      ),
    );
  }

  Future opendailoge(
      {required int index,
      required String id,
      required AsyncSnapshot<DatabaseEvent> snapshot}) async {
    final editpost = TextEditingController();

    final ref = FirebaseDatabase.instance.ref("Data");
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Here'),
        content: TextFormField(
          controller: editpost,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              filled: true,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              fillColor: Color(0xFFF7F8F9),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              hintText: 'Type here',
              hintStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
              labelStyle: GoogleFonts.poppins(
                color: Color(0xFF7C7C7C),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0.10,
              )),
          validator: (email) {
            if (email!.isEmpty) {
              return 'Enter something';
            }
            return null;
          },
        ),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black)),
              onPressed: () {
                ref
                    .child(id)
                    .update({'title': editpost.text.toString()})
                    .then(
                      (value) => {
                        ToastMessage()
                            .toastmessage(message: 'Edited Succesfull'),
                        editpost.clear(),
                        Navigator.pop(context),
                      },
                    )
                    .onError(
                      (error, stackTrace) => ToastMessage()
                          .toastmessage(message: error.toString()),
                    );
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
