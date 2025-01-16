

import 'dart:math';

import 'package:chittoo/Log_In_Pages/Log_In_Page.dart';
import 'package:chittoo/Log_In_Pages/guest_Login.dart';
import 'package:chittoo/Screen/Intro_Page/Congraulations/Congraulations.dart';
import 'package:chittoo/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SignUpProgressSave extends StatefulWidget {
  @override
  _SignUpProgressSaveState createState() => _SignUpProgressSaveState();
}

class _SignUpProgressSaveState extends State<SignUpProgressSave> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xFFF57952),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/whyinterestUi.png",
                        height: 160, // Set your desired height
                        width: 160, // Set your desired width
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Sign-Up to save\n your progress",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
      Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Log_In())),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFF57952),
                        ),
                        child: Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: GestureDetector(
                      onTap: () {
                         showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      registerWithRandomCredentials();
                      
                      Future.delayed(Duration(seconds: 6), () {
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CongraulationsPage(isFromSignUp: false,)));
                      });
                   
                       }, child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFF57952),width:1.5),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white
                        ),
                        child: Center(
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: Color(0xFFF57952),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                    ],
                  )
                  ,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}