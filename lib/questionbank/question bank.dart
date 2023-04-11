import 'package:allnotes/Chapteruploadscreen.dart/notedesignwidget.dart';
import 'package:allnotes/Chapteruploadscreen.dart/chapteruploadscreen.dart';

import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:allnotes/model/menus.dart';
import 'package:allnotes/questionbank/bankdetails/bankdetails.dart';
import 'package:allnotes/questionbank/bankdetails/shortupload.dart';
import 'package:allnotes/questionbank/questionbankdesign.dart';
import 'package:allnotes/questionbank/questionbankupload.dart';
import 'package:allnotes/widgets/progreebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class QuestionBank extends StatefulWidget {
  final Menus? model;

  const QuestionBank({super.key, this.model});

  @override
  State<QuestionBank> createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('QuestionBank'),
            
            IconButton(
              icon: const Icon(
                Icons.post_add,
                color: Colors.blue,
              ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return QuestionBankUploadScreen(
                  model: widget.model
                 );
               },));
              },
            ),
          
          ],
        ),
            Container(
              
              child: StreamBuilder<QuerySnapshot>(
               stream: FirebaseFirestore.instance
                .collection("admins")
                .doc(sharedPreferences!.getString("uid"))
                .collection("semester")
                .doc(widget.model!.menuID)
                .collection("bank")
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
                      return QuestionBankDesignWidget(
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