import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/QuestionScreen/Questioncreen.dart';
import 'package:allnotes/model/chapter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'dart:math' as Math;

import 'package:fluttertoast/fluttertoast.dart';







class QuestionWidget extends StatefulWidget {
  Items? model;
  BuildContext? context;

  QuestionWidget({this.model, this.context});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (c) => ItemDetailsScreen(model: widget.model)));
      },
      splashColor: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
         
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                
                
               
                
              
                Container(
                  width: MediaQuery.of(context).size.width-15,
                  child: Text(
                   widget.model!.question.toString(),
                    style: const TextStyle(
                     
                      fontSize: 15,
                    ),
                  ),
                ),
               





                
              ],
            ),
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
