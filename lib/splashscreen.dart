import 'dart:async';
import 'dart:math';

import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/HomeScreen/homescreen.dart';
import 'package:allnotes/authscreen/Authscreen.dart';
import 'package:flutter/material.dart';
class MySplashScreen extends StatefulWidget {


  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer(){

    Timer(Duration(seconds: 1), ()async{

      if(firebaseAuth.currentUser!=null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen(),));
      }
    });
  }
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('All Notes',style: TextStyle(
            fontSize: 30
          ),),
          Text('Welcome to the biggest platform of learning.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
           
          ),),
        ],

        ),
      ),

    );
  }
}