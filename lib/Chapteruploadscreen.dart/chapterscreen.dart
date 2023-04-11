import 'package:allnotes/Chapteruploadscreen.dart/notedesignwidget.dart';
import 'package:allnotes/Chapteruploadscreen.dart/chapteruploadscreen.dart';
import 'package:allnotes/Chapteruploadscreen.dart/notesscreen.dart';

import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:allnotes/model/menus.dart';
import 'package:allnotes/questionbank/question%20bank.dart';
import 'package:allnotes/widgets/progreebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChapterScreen extends StatefulWidget {
final Menus? model;

  const ChapterScreen({super.key, this.model});
  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          title: Text(widget.model!.book.toString(),
          style: TextStyle(fontSize: 15,
          ),),
          centerTitle: true,
          automaticallyImplyLeading: true,
          bottom: TabBar(
          tabs: [
            Tab(
              text: 'Notes',
            ),
            Tab(
              text: 'Question',
            )
          ],
          ),
         actions: [
            IconButton(
              icon: const Icon(
                Icons.post_add,
                color: Colors.blue,
              ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return ChapterUploadScreen(
                  model: widget.model
                 );
               },));
              },
            ),
          ],
        ),
        
        body: TabBarView(children: [
          NoteScreen(model: widget.model,),
          QuestionBank(model: widget.model,)
        ])
    
      ),
    );
  }
}