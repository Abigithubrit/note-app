import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:allnotes/model/menus.dart';
import 'package:allnotes/widgets/customtextformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class TimeUploadScreen extends StatefulWidget {
 final Items? model;

  const TimeUploadScreen({super.key, this.model});

  @override
  State<TimeUploadScreen> createState() => _TimeUploadScreenState();
}

class _TimeUploadScreenState extends State<TimeUploadScreen> {
  
  final full =TextEditingController();
  final pass =TextEditingController();
  final time =TextEditingController();

  
  bool uploading = false;
  String uniqueIdName =DateTime.now().millisecondsSinceEpoch.toString();

  save() {
    final ref = FirebaseFirestore.instance
        .collection("admins")
        .doc(sharedPreferences!.getString("uid"))
        .collection("semester").doc(widget.model!.menuID)
        .collection('bank')
        .doc(widget.model!.itemID)
        .collection('time')
        
        ;

    ref.doc(uniqueIdName).set({
      "itemID": uniqueIdName,
      "menuID": widget.model!.menuID,
      "adminUID": sharedPreferences!.getString("uid"),
      "name": sharedPreferences!.getString("name"),
      'full':full.text.toString(),
      'pass':pass.text.toString(),
      'time':time.text.toString(),
    
    
      "publishedDate": DateTime.now(),
      
    }).then((value) {
       final itemsRef = FirebaseFirestore.instance.collection("items");

       
    itemsRef.doc(uniqueIdName).set({
      "itemID": uniqueIdName,
      "menuID": widget.model!.menuID,
      "adminUID": sharedPreferences!.getString("uid"),
      "name": sharedPreferences!.getString("name"),
      'full':full.text.toString(),
      'pass':pass.text.toString(),
      'time':time.text.toString(),
     
    
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
                  controller: full,
                  hinttext: 'full marks',
                  isObsecure: false,
                ),
                 Customtextfield(
                  data: Icons.text_fields,
                  controller: pass,
                  hinttext: 'pass marks',
                  isObsecure: false,
                ),
                Customtextfield(
                  data: Icons.text_fields,
                  controller: time,
                  hinttext: 'total time',
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