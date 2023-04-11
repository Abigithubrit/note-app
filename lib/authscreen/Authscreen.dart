import 'package:allnotes/authscreen/loginscreen.dart';
import 'package:allnotes/authscreen/registerscreen.dart';
import 'package:flutter/material.dart';
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('All Notes'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person,color: Colors.white,
              ),
              child: Text('Login'),
            ),
             Tab(
              icon: Icon(Icons.person,color: Colors.white,
              ),
              child: Text('Register'),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            LoginScreen(),
            RegisterScreen()
          ],
        ),
      ),

    );
  }
}