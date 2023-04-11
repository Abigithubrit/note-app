import 'package:allnotes/GLobal/global.dart';
import 'package:allnotes/HomeScreen/semesterdesign.dart';
import 'package:allnotes/HomeScreen/semesteruploadscreen.dart';
import 'package:allnotes/model/menus.dart';
import 'package:allnotes/widgets/mydrawer.dart';
import 'package:allnotes/widgets/progreebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All notes')
        ,
        centerTitle: true,
      
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SemesterUploadScreen(),));
          },
           icon: Icon(Icons.post_add))
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
        
            Container(
              
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('admins')
                .doc(sharedPreferences!.getString('uid'))
                .collection('semester')
               
                .snapshots(),
            
                builder:(context, snapshot) {
                  return !snapshot.hasData? 
                  Center(child: circularProgress(),)
                  :ListView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                   
                    itemBuilder:(context, index) {
                    Menus sModel = Menus.fromJson(
                        snapshot.data!.docs[index].data() as Map<String,dynamic>
                      );
                      //design for display sellers cafes
                      return SemesterDesignWidget(
                      model:sModel,
                        context: context,
                      );
                    },);
                }, ),
            )
          
          ],
        ),
      ),
    );
  }
}