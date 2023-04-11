import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:allnotes/model/menus.dart';
import 'package:allnotes/widgets/customtextformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class QuestionBankUploadScreen extends StatefulWidget {
 final Menus? model;

  const QuestionBankUploadScreen({super.key, this.model});

  @override
  State<QuestionBankUploadScreen> createState() => _QuestionBankUploadScreenState();
}

class _QuestionBankUploadScreenState extends State<QuestionBankUploadScreen> {
  final year =TextEditingController();
  final course =TextEditingController();
  final sem =TextEditingController();
  bool uploading = false;
  String uniqueIdName =DateTime.now().millisecondsSinceEpoch.toString();

  save() {
    final ref = FirebaseFirestore.instance
        .collection("admins")
        .doc(sharedPreferences!.getString("uid"))
        .collection("semester").doc(widget.model!.menuID)
        .collection('bank');

    ref.doc(uniqueIdName).set({
      "itemID": uniqueIdName,
      "menuID": widget.model!.menuID,
      "adminUID": sharedPreferences!.getString("uid"),
      "name": sharedPreferences!.getString("name"),
      'year':year.text.toString(),
      'course':course.text.toString(),
      'sem':sem.text.toString(),
     
    
      "publishedDate": DateTime.now(),
      
    }).then((value) {
       final itemsRef = FirebaseFirestore.instance.collection("items");

       
    itemsRef.doc(uniqueIdName).set({
      "itemID": uniqueIdName,
      "menuID": widget.model!.menuID,
      "adminUID": sharedPreferences!.getString("uid"),
      "name": sharedPreferences!.getString("name"),
      'year':year.text.toString(),
      'course':course.text.toString(),
      'sem':sem.text.toString(),
    
      "publishedDate": DateTime.now(),
      
    });
    }).then((value){
    

    setState(() {
      uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
  
    });
    });

   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
children: [
  Customtextfield(
                  data: Icons.text_fields,
                  controller: year,
                  hinttext: 'year',
                  isObsecure: false,
                ),
  Customtextfield(
                  data: Icons.text_fields,
                  controller: course,
                  hinttext: 'course',
                  isObsecure: false,
                ),
                Customtextfield(
                  data: Icons.text_fields,
                  controller: sem,
                  hinttext: 'semester',
                  isObsecure: false,
                ),
                
   GestureDetector(
                  onTap: (){
                    save();
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