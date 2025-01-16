import 'package:chittoo/Log_In_Pages/Log_In_Page.dart';
import 'package:chittoo/Screen/Intro_Page/getStartedIntro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NewIntroPage extends StatefulWidget {
  @override
  _NewIntroPageState createState() => _NewIntroPageState();
}

class _NewIntroPageState extends State<NewIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Image.asset(
              "assets/images/chittoo_logo.png",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 90,
            ),
            Text(
              "English for daily life",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF57952)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Confidence in",
              style: TextStyle(color: Colors.grey[600]),
            ),
            Text(
              "English begins here.",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
onTap: () => 
Navigator.push(context, MaterialPageRoute(builder: (context)=>GetStartedIntro())),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFF57952)),
                    child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),  
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>Log_In())),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFF57952),width: 2
                    ),
                    borderRadius: BorderRadius.circular(30)),
                     child: Center(child: Text("Already have a account",style: TextStyle(color: Color(0xFFF57952),fontSize: 16,fontWeight: FontWeight.bold),)),  
              ),
            )
          ]),
        ),
      ),
    );
  }
}
