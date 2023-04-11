import 'package:cloud_firestore/cloud_firestore.dart';

class Banks
{
  String? menuID;
  String? adminUID;
  String? itemID;
  String? bankID;
  String? unit;
  
  String? question;
  String? number;
  String? course;
  String? sem;

  Timestamp? publishedDate;



  Banks({
    this.menuID,
    this.adminUID,
    this.itemID,
    this.bankID,
    this.unit,
    this.question,
    this.number,
    this.sem,
   this.course,
    this.publishedDate,

  });

  Banks.fromJson(Map<String, dynamic> json)
  {
    menuID = json['menuID'];
    adminUID = json['adminUID'];
    itemID = json['itemID'];
    bankID = json['bankID'];
    unit= json['ques'];
    question= json['question'];
    number= json['number'];
    sem= json['sem'];
    course= json['course'];
 
    publishedDate = json['publishedDate'];

  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['menuID'] = menuID;
    data['adminUID'] = adminUID;
    data['itemID'] = itemID;
    data['bankID'] = bankID;
    data['ques'] = unit;
    data['question'] = question;
    data['number'] = number;
    data['sem'] = sem;
    data['course'] = course;
 data['publishedDate'] = publishedDate;


    return data;
  }
}
