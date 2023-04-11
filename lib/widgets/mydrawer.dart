import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/HomeScreen/homescreen.dart';
import 'package:allnotes/authscreen/Authscreen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
         
          Container(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              children: [
               const Divider(
                  height: 10,
                  color: Colors.black,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.home,color: Colors.black,),
                  title: const Text('Home',style: TextStyle(
                    color: Colors.black
                  ),
                  ),onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeScreen()));
                  },
                ),
           
              
              
                ListTile(
                  leading: const Icon(Icons.exit_to_app,color: Colors.black,),
                  title: const Text('Sign Out',style: TextStyle(
                    color: Colors.black
                  ),
                  ),onTap: (){
                     firebaseAuth.signOut().then((value){
             Navigator.push(context, MaterialPageRoute(builder: (c)=>AuthScreen()));
          });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}