import 'dart:io';

import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/auth_bloc/auth_event.dart';
import 'package:education_app/screens/login_screen.dart';
import 'package:education_app/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:education_app/models/user.dart' as user_model;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user_model.User _user = user_model.User(firstName: 'Yusufcan', lastName: 'Adıgüzel', email: 'ya@gmail.com', password: '123456');

  User? checkUser(){
    if(_auth.currentUser == null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
      return null;
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
      return _auth.currentUser;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
    checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1D3566),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/education-app-blue-logo.png',
                  ),
                  const CircularProgressIndicator(
                    color: Color(0xFF1D3566),
                    strokeWidth: 5.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
