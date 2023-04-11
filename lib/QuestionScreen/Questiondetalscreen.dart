import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/HomeScreen/homescreen.dart';

import 'package:allnotes/QuestionScreen/questionupload.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ItemDetailsScreen extends StatefulWidget {
  final Items? model;
  ItemDetailsScreen({this.model});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  TextEditingController ans = TextEditingController();

  deleteItem(String item) {
    FirebaseFirestore.instance
        .collection("admins")
        .doc(sharedPreferences!.getString("uid"))
        .collection("semester")
        .doc(widget.model!.menuID)
        .collection("items")
        .doc(widget.model!.itemID!)
        .collection("questions")
        .doc(item)
        .delete()
        .then((value) {
      FirebaseFirestore.instance.collection("questions").doc(item).delete();

      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      Fluttertoast.showToast(msg: "Item Deleted Successfully.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
             
              SizedBox(height: 20,),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     widget.model!.number.toString() +'. ' ,
                     
                      style:
                          const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-70,
                      child: Text(widget.model!.question.toString())),
                      
                  ],
                ),
              ),
          
              const SizedBox(
                height: 5,
              ),
              Text(widget.model!.ans.toString()),
             
            ],
          ),
        ),
      ),
    );
  }
}