import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:allnotes/model/menus.dart';
import 'package:allnotes/widgets/customtextformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class QuestionUploadScreen extends StatefulWidget {
 final Items? model;

  const QuestionUploadScreen({super.key, this.model});

  @override
  State<QuestionUploadScreen> createState() => _QuestionUploadScreenState();
}

class _QuestionUploadScreenState extends State<QuestionUploadScreen> {
  final question =TextEditingController();
  final number =TextEditingController();
  final ans = TextEditingController();
  
  bool uploading = false;
  String uniqueIdName =DateTime.now().millisecondsSinceEpoch.toString();

  save() {
    final ref = FirebaseFirestore.instance
        .collection("admins")
        .doc(sharedPreferences!.getString("uid"))
        .collection("semester").doc(widget.model!.menuID)
        .collection('items')
        .doc(widget.model!.itemID)
        .collection('questions')
        
        ;

    ref.doc(uniqueIdName).set({
      "itemID": uniqueIdName,
      "menuID": widget.model!.menuID,
      "adminUID": sharedPreferences!.getString("uid"),
      "name": sharedPreferences!.getString("name"),
      'question':question.text.toString(),
      'number':number.text.toString(),
      'ans':ans.text.toString(),
     
    
      "publishedDate": DateTime.now(),
      
    }).then((value) {
       final itemsRef = FirebaseFirestore.instance.collection("items");

       
    itemsRef.doc(uniqueIdName).set({
      "itemID": uniqueIdName,
      "menuID": widget.model!.menuID,
      "adminUID": sharedPreferences!.getString("uid"),
      "name": sharedPreferences!.getString("name"),
      'question':question.text.toString(),
      'number':number.text.toString(),
      'ans':ans.text.toString(),
      
    
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
                  controller: number,
                  hinttext: 'number',
                  isObsecure: false,
                ),
  Customtextfield(
                  data: Icons.text_fields,
                  controller: question,
                  hinttext: 'Question',
                  isObsecure: false,
                ),
                Customtextfield(
                  data: Icons.text_fields,
                  controller: ans,
                  hinttext: 'answer',
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