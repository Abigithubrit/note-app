import 'package:cloud_firestore/cloud_firestore.dart';

class Menus
{
  String? menuID;
  String? adminUID;
  String? number;
  String? book;
  Timestamp? publishedDate;



  Menus({
    this.menuID,
    this.adminUID,
    this.number,
    this.book,
    this.publishedDate,


  });

  Menus.fromJson(Map<String, dynamic> json)
  {
    menuID = json["menuID"];
    adminUID = json['adminUID'];
    number = json['number'];
    book = json['book'];
    publishedDate = json['publishedDate'];
 
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["menuID"] = menuID;
    data['adminUID'] = adminUID;
    data['number'] = number;
    data['book'] = book;
    data['publishedDate'] = publishedDate;
   

    return data;
  }
}