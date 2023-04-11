
import 'package:allnotes/QuestionScreen/questiondesign.dart';
import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/QuestionScreen/questionupload.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:allnotes/model/menus.dart';
import 'package:allnotes/questionbank/bankdetails/bankqndesign.dart';
import 'package:allnotes/questionbank/bankdetails/questiontitle/headingdesign.dart';
import 'package:allnotes/questionbank/bankdetails/questiontitle/question%20headingupload.dart';
import 'package:allnotes/questionbank/bankdetails/questiontitle/timedesign.dart';
import 'package:allnotes/questionbank/bankdetails/questiontitle/timeupload.dart';
import 'package:allnotes/questionbank/bankdetails/shortqntitleupload.dart';
import 'package:allnotes/questionbank/bankdetails/shortupload.dart';
import 'package:allnotes/questionbank/bankdetails/longupload.dart';
import 'package:allnotes/widgets/progreebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BankScreen extends StatefulWidget {
final Items? model;

  const BankScreen({super.key, this.model});
  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           
       appBar: AppBar(
        title: Text(widget.model!.year.toString()),
        centerTitle: true,
       ),

   
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(height: 10,),
           Center(
            child: Text('      Tribhuwan University',
            style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.bold
            ),),
           ),
            Center(
            child: Text('     Institute of Science and Technology',
            style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.bold
            ),),
           ),
           SizedBox(height: 3,),
           Center(
            child: Text(widget.model!.year.toString(),
            style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.bold
            ),),
           ),
           SizedBox(height: 10,),
           Text('Bachelor Level / '+widget.model!.sem.toString()+' Semester'),
           Text('('+widget.model!.course.toString()+')'),
           Container(
            width: MediaQuery.of(context).size.width-30,
            child: Text('Candidates are required to give their answer in their own words as far as possible.')),
        Text('The figures in the margin indicate full marks.'),
         Row(
           children: [
             IconButton(
              icon: const Icon(
                Icons.post_add,
                color: Colors.blue,
              ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return TimeUploadScreen(
                  model: widget.model
                 );
               },));
              },
        ),
        Text('Time/marks')
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
                .doc(widget.model!.itemID)
                .collection('time')
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
                      return TimeWidget(
                        model: sModel,
                        context: context,
                      );
                    },);
                }, ),
            ),
        Divider(),
          Row(
           children: [
             IconButton(
              icon: const Icon(
                Icons.post_add,
                color: Colors.blue,
              ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return TitleUploadScreen(
                  model: widget.model
                 );
               },));
              },
        ),
        Text('Long Question  Group A Title')
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
                .doc(widget.model!.itemID)
                .collection('title')
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
                      return HeadingWidget(
                        model: sModel,
                        context: context,
                      );
                    },);
                }, ),
            ),





//Long  Questions
         Row(
           children: [
             IconButton(
              icon: const Icon(
                Icons.post_add,
                color: Colors.blue,
              ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return LongUploadScreen(
                  model: widget.model
                 );
               },));
              },
        ),
        Text('Group A Question')
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
                .doc(widget.model!.itemID)
                .collection('long')
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
                      return QuestionWidget(
                        model: sModel,
                        context: context,
                      );
                    },);
                }, ),
            ),



//group b title
             Row(
           children: [
             IconButton(
              icon: const Icon(
                Icons.post_add,
                color: Colors.blue,
              ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return ShorTUploadScreen(
                  model: widget.model
                 );
               },));
              },
        ),
        Text('Group B Question title')
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
                .doc(widget.model!.itemID)
                .collection('shorttitle')
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
                     
                      return HeadingWidget(
                        model: sModel,
                        context: context,
                      );
                    },);
                }, ),
            ),





      Row(
              children: [
                IconButton(
          icon: const Icon(
                Icons.post_add,
                color: Colors.blue,
          ),
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return BankUploadScreen(
                  model: widget.model
                 );
           },));
          },
        ),
        
        Text('Group  B Question')
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
                .doc(widget.model!.itemID)
                .collection('question')
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
                      return QuestionWidget(
                        model: sModel,
                        context: context,
                      );
                    },);
                }, ),
            ),
           
          
          ],
        ),
      ),

    );
  }
}