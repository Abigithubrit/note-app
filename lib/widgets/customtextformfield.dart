import 'package:flutter/material.dart';
class Customtextfield extends StatelessWidget {
final TextEditingController? controller;
final IconData? data;
final String? hinttext;
bool? isObsecure=true;
bool? enabled=true;

Customtextfield({super.key,
 this.controller, 
 this.data,
  this.hinttext,
  this.isObsecure,
  this.enabled});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        obscureText: isObsecure!,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            data,
            color: Colors.cyan,
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: hinttext











          
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10),
        ),
        
      ),
    );
  }
}