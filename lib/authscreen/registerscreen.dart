import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/HomeScreen/homescreen.dart';
import 'package:allnotes/widgets/customtextformfield.dart';
import 'package:allnotes/widgets/errordidalog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final course =TextEditingController();
  final emailController =TextEditingController();
  final passwordController =TextEditingController();

  void SignUp() async{
  User? currentUser;
  
  await firebaseAuth.createUserWithEmailAndPassword(
    email: emailController.text.trim(), 
    password: passwordController.text.trim(),).then((auth){
    currentUser = auth.user;
    }).catchError((error){
      Navigator.pop(context);
      showDialog(context: context,
       builder:(c){
        return ErrorDialog(
          message: error.message.toString(),
        );
       });
    });
    if(currentUser !=null){
      saveDataToFireStore(currentUser!).then((value){
        Navigator.pop(context);
        //send user to homepage
        Route newRoute =MaterialPageRoute(builder: (c)=>HomeScreen());
        Navigator.pushReplacement(context, newRoute);
      });
    }
}

Future saveDataToFireStore(User currentUser)async{
  FirebaseFirestore.instance.collection('admins').doc(currentUser.uid).set({
    'adminUID':currentUser.uid,
    'Email':currentUser.email,
    'course':course.text.trim(),
    'password':passwordController.text.trim(),
 
});
//Save data locally
 sharedPreferences=await SharedPreferences.getInstance();
await sharedPreferences!.setString('uid', currentUser.uid);
await sharedPreferences!.setString('name', course.text.trim());
await sharedPreferences!.setString('Email', emailController.text.trim());





}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Form(
            key: _formkey,
            child: Column(
            children: [
              Customtextfield(
                  data: Icons.person,
                  controller: course,
                  hinttext: 'course',
                  isObsecure: false,
                ),
                Customtextfield(
                  data: Icons.email,
                  controller: emailController,
                  hinttext: 'email',
                  isObsecure: false,
                ),
                Customtextfield(
                  data: Icons.lock,
                  controller: passwordController,
                  hinttext: 'password',
                  isObsecure: false,
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                  SignUp();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      child: Text('Sign Up'),
                    ),
                  ),
                )
            ],
          ))
        ],
      ),
    );
  }
}