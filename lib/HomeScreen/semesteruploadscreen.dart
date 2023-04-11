import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/widgets/customtextformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SemesterUploadScreen extends StatefulWidget {
  const SemesterUploadScreen({super.key});

  @override
  State<SemesterUploadScreen> createState() => _SemesterUploadScreenState();
}

class _SemesterUploadScreenState extends State<SemesterUploadScreen> {
  bool uploading = false;
  String uniqueIdName =DateTime.now().millisecondsSinceEpoch.toString();
  final number = TextEditingController();
  final book = TextEditingController();
  saveInfo() {
    final ref = FirebaseFirestore.instance
        .collection("admins")
        .doc(sharedPreferences!.getString("uid"))
        .collection("semester");

    ref.doc(uniqueIdName).set({
      "menuID": uniqueIdName,
      "adminUID": sharedPreferences!.getString("uid"),
      "number": number.text.toString(),
      "book": book.text.toString(),
      "publishedDate": DateTime.now(),
      
    });

   

    setState(() {
      uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
    
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploading New Semester',
        style: TextStyle(
          fontSize: 18,

        ),),
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Customtextfield(
                  data: Icons.numbers,
                  controller: number,
                  hinttext: 'number',
                  isObsecure: false,
                ),
                Customtextfield(
                  data: Icons.text_fields,
                  controller: book,
                  hinttext: 'book',
                  isObsecure: false,
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
              saveInfo();
              Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      child: Text('Add'),
                    ),
                  ),
                )
          ],
        ),
      ),
      
    );
  }
}