

import 'package:chittoo/SignUpQuestionnaire/signUpQuestionnaire.dart';
import 'package:chittoo/globals.dart';
import 'package:flutter/material.dart';

class GetStartedIntro extends StatefulWidget {
  @override
  _GetStartedIntroState createState() => _GetStartedIntroState();
}

class _GetStartedIntroState extends State<GetStartedIntro> {
  @override
  void initState() {
    setState(() {
      isFromGetStarted= true;
      print("getstartedture"+isFromGetStarted.toString());
    });
    super.initState();
    // Add your initialization code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Stateful Widget'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150,),
                Image.asset(
                  "assets/images/introImage1.png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 140,),
                Text(
                  "Daily new topics",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF57952)
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  "Master new skills daily",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Text(
                  "and feel the progress",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600]
                  ),
                ),SizedBox(height: 80,),
                GestureDetector(
                  onTap: () => 
                  
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStartedIntroTwo())),
                  
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF57952)),
                    child: Center(
                        child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GetStartedIntroTwo extends StatefulWidget {
  @override
  _GetStartedIntroStateTwo createState() => _GetStartedIntroStateTwo();
}

class _GetStartedIntroStateTwo extends State<GetStartedIntroTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Stateful Widget'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150,),
                Image.asset(
                  "assets/images/introImage2.png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 140,),
                Text(
                  "Daily new topics",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF57952)
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  "Master new skills daily",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Text(
                  "and feel the progress",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600]
                  ),
                ),SizedBox(height: 80,),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SelectLanguage ())),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF57952)),
                    child: Center(
                        child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
