import 'package:allnotes/Chapteruploadscreen.dart/chapterscreen.dart';
import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/model/menus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



import 'dart:math' as Math;







class SemesterDesignWidget extends StatefulWidget {
  Menus? model;
  BuildContext? context;

  SemesterDesignWidget({this.model, this.context});

  @override
  _SemesterDesignWidgetState createState() => _SemesterDesignWidgetState();
}

class _SemesterDesignWidgetState extends State<SemesterDesignWidget> {
  deleteMenu(String menuID) {
    FirebaseFirestore.instance
        .collection("admins")
        .doc(sharedPreferences!.getString("uid"))
        .collection("semester")
        .doc(menuID)
        .delete();

    Fluttertoast.showToast(msg: "Menu Deleted Successfully.");
  }

void dialog(){
    showDialog(
      context: context,
       builder: (context){
        return AlertDialog(
          backgroundColor: Colors.pink,
          title: Center(child: Text('Confirm Delete')),
          
         
          actions: [
            MaterialButton(onPressed: (){
             deleteMenu(widget.model!.menuID!);
            },
            child: Text('Delete'),),
            MaterialButton(onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Cancel'),),
          ],
        );
       });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => ChapterScreen(model: widget.model,)));
      },
      splashColor: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
  
          width: MediaQuery.of(context).size.width,
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            
               
              

           
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    widget.model!.number!,
                    style: const TextStyle(
                  
                  fontSize: 20,
                     
                    ),
                  ),
                         
                 
                  Text(
                    widget.model!.book!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Signatra',
                      fontSize: 15,
                    ),
                  ),
                 ],),
               ),
             ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                  onTap: 
                  dialog,
                  child: Icon(Icons.delete_sweep,color: Colors.red,)),
                ),


              // Text(
              //   widget.model!.lat!.toStringAsFixed(2) + "km" ,
              //   style: const TextStyle(
              //     color: Colors.grey,
              //     fontSize: 12,
              //   ),
              // ),



              
            ],
          ),
        ),
      ),
    );
  }
//
// //HaverSine formula
//   double getDistanceFromLatLonInKm({ required lat1,required lon1,required lat2,required lon2}) {
//     var R = 6371; // Radius of the earth in km
//     var dLat = deg2rad(lat2-lat1);  // deg2rad below
//     var dLon = deg2rad(lon2-lon1);
//     var a =
//         Math.sin(dLat/2) * Math.sin(dLat/2) +
//             Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
//                 Math.sin(dLon/2) * Math.sin(dLon/2)
//     ;
//
//     var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
//     var d = R * c; // Distance in km
//     return d;
//   }
//
//   double deg2rad(deg) {
//     return deg * (Math.pi/180);
//   }
//
//
//   // get Current Location
//   _getCurrentLocation() {
//     Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.best,
//         forceAndroidLocationManager: true)
//         .then((Position position) {
//       distanceCalculation(position);
//       setState(() {
//         _currentPosition = position;
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }
//
//   distanceCalculation(Position position) {
//
//       var km = getDistanceFromLatLonInKm(lat1:position.latitude, lon1: position.longitude, lat2: widget.model!.lat, lon2: widget.model!.lng);
//       // var m = Geolocator.distanceBetween(position.latitude,position.longitude, d.lat,d.lng);
//       // d.distance = m/1000;
//       var distance = km;
//       destinationlist.add(d);
//       // print(getDistanceFromLatLonInKm(position.latitude,position.longitude, d.lat,d.lng));
//
//
//
//   //
//   //   setState(() {
//   //     destinationlist.sort((a, b) {
//   //       return a.distance.compareTo(b.distance);
//   //     });
//   //   });
//   // }

}

//
// class Destination{
//   double lat;
//   double lng;
//   String name;
//   double distance;
//
//   Destination(this.lat, this.lng, this.name,{this.distance});
// }
