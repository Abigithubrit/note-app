
import 'package:allnotes/QuestionScreen/questiondesign.dart';
import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/QuestionScreen/questionupload.dart';
import 'package:allnotes/model/bank.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:allnotes/model/menus.dart';
import 'package:allnotes/widgets/progreebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
final Items? model;

  const QuestionScreen({super.key, this.model});
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.yellow,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
        ),
        title: Text(widget.model!.unit.toString(),
        style: TextStyle(fontSize: 14,
        fontFamily: 'Lobster'),),
        centerTitle: true,
        automaticallyImplyLeading: true,
       actions: [
          IconButton(
            icon: const Icon(
              Icons.post_add,
              color: Colors.blue,
            ),
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) {
               return QuestionUploadScreen(
                model: widget.model
               );
             },));
            },
          ),
        ],
      ),
   
      body: SingleChildScrollView(
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
                .doc(widget.model!.itemID)
                .collection('questions')
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
                      return QuestionsDesignWidget(
                        model: sModel,
                        context: context,
                      );
                    },);
                }, ),
            )
          
          ],
        ),
      ),

    );
  }
}