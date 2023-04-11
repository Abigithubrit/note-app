import 'package:cloud_firestore/cloud_firestore.dart';

class Items
{
  String? menuID;
  String? adminUID;
  String? itemID;
  String? unit;
  String? sem;
  String? question;
  String? number;
  String? marks;
  String? course;
  String? ans;
  String? year;
  String? group;
  String? title;
  String? full;
  String? pass;
  String? time;
  Timestamp? publishedDate;



  Items({
    this.menuID,
    this.adminUID,
    this.itemID,
    this.unit,
    this.marks,
    this.question,
    this.number,
    this.sem,
    this.ans,
    this.year,
   this.course,
    this.title,
   this.group,
    this.publishedDate,
    this.full,
    this.pass,
    this.time
  });

  Items.fromJson(Map<String, dynamic> json)
  {
    menuID = json['menuID'];
    adminUID = json['adminUID'];
    itemID = json['itemID'];
    unit= json['ques'];
    marks= json['marks'];
    question= json['question'];
    number= json['number'];
    sem= json['sem'];
    year= json['year'];
    course= json['course'];
    ans= json['ans'];
    group= json['group'];
    title= json['title'];
    full= json['full'];
    pass= json['pass'];
    time= json['time'];
    publishedDate = json['publishedDate'];

  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['menuID'] = menuID;
    data['adminUID'] = adminUID;
    data['itemID'] = itemID;
    data['ques'] = unit;
    data['marks'] = marks;
    data['question'] = question;
    data['number'] = number;
    data['sem'] = sem;
    data['ans'] = ans;
    data['year'] = year;
    data['course'] = course;
    data['group'] =group;
    data['title'] = title;
    data['full'] = full;
    data['pass'] = pass;
    data['time'] = time;
 data['publishedDate'] = publishedDate;


    return data;
  }
}
