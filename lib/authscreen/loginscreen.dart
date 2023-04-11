import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/HomeScreen/homescreen.dart';
import 'package:allnotes/authscreen/Authscreen.dart';
import 'package:allnotes/widgets/customtextformfield.dart';
import 'package:allnotes/widgets/errordidalog.dart';
import 'package:allnotes/widgets/loadingdialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    loginNow()async{
     showDialog(context: context,
       builder: (c){
        return const LoadingDialog(
          message: 'Checking credentials',
        );
       });
       User? currentUser;
       await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim()
        ).then((auth){
          currentUser =auth.user!;
        }).catchError((error){
          Navigator.pop(context);
          showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });

        });
        if(currentUser !=null)
        {
          readDataAndSetDataLocally(currentUser!);
        }
  }
 Future readDataAndSetDataLocally(User currentUser)async{
  await FirebaseFirestore.instance.collection('admins')
  .doc(currentUser.uid)
  .get().then((snapshot)async{
    if(snapshot.exists){
    await sharedPreferences!.setString('uid', currentUser.uid);
    await sharedPreferences!.setString('Email',snapshot.data()!['Email']);
   

      Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomeScreen(),));
    }else{
        firebaseAuth.signOut();
    Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context) =>const AuthScreen(),));
     showDialog(context: context,
      builder: (c){
        return ErrorDialog(
          message: 'No record found.Try Signing Up',
        );
      });

    }
  });
 }
   
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Form(
            key: _formkey,
            child: Column(
            children: [
              SizedBox(height: 150,),
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
                  isObsecure: true,
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    loginNow();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      child: Text('Log in'),
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