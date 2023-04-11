import 'package:allnotes/Chapteruploadscreen.dart/notedesignwidget.dart';
import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:allnotes/model/menus.dart';
import 'package:allnotes/widgets/progreebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class NoteScreen extends StatefulWidget {
  final Menus? model;

  const NoteScreen({super.key, this.model});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
        
            Container(
              
              child: StreamBuilder<QuerySnapshot>(
               stream: FirebaseFirestore.instance
                .collection("admins")
                .doc(sharedPreferences!.getString("uid"))
                .collection("semester")
                .doc(widget.model!.menuID)
                .collection("items")
                .snapshots(),
                builder:(context, snapshot) {
                  return !snapshot.hasData? 
                  Center(child: circularProgress(),)
                  :ListView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                   
                    itemBuilder:(context, index) {
                    Items sModel = Items.fromJson(
                        snapshot.data!.docs[index].data() as Map<String,dynamic>
                      );
                      //design for display sellers cafes
                      return ChaptersDesignWidget(
                        model: sModel,
                        context: context,
                      );
                    },);
                }, ),
            )
          
          ],
        ),
      );

  }
}