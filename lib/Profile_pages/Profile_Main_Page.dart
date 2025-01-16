import 'package:chittoo/Profile_pages/Settings/settings_mainpage.dart';
import 'package:chittoo/globals.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'Card_Views/Doubt_CardView.dart';
import 'Card_Views/Invite_CardView.dart';
import 'Card_Views/Progress_Card.dart';
import 'Card_Views/Rate_CardView.dart';
import 'Card_Views/Social_CardView.dart';
import 'Card_Views/Vocabulary_CardView.dart';
import 'Edit_Profile_pages/Edit_profile.dart';
import 'Extra_List_View.dart';
import 'Levels_ListView_Container.dart';
import 'Progress_report.dart';

class Profile_Main_Page extends StatefulWidget {
  const Profile_Main_Page({super.key});

  @override
  State<Profile_Main_Page> createState() => _Profile_Main_PageState();
}

bool _isDataLoaded = false;
String? userName;

@override
class _Profile_Main_PageState extends State<Profile_Main_Page> {
  void initState() {
    getUserdata();
  }

  void getUserdata() async {
    final sf = await SharedPreferences.getInstance();
    userName = sf.getString("username");
    print("objectusername" + userName.toString());
    setState(() {
      _isDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size page_size = MediaQuery.of(context).size;
    Color _btn_color = const Color(0xFFF57952);
    return WillPopScope(
       onWillPop: () async {
        // Returning false blocks the back button.
        return false;
      },
      child: Scaffold(
          body: SafeArea(
        child: Container(
          width: page_size.width,
          height: page_size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            right: page_size.width * 0.040,
                            top: page_size.height * 0.020),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Settings_MainPage();
                              }));
                            },
                            icon: const Icon(
                              Icons.settings,
                              color: Color(0xFFF57952),
                            ))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage("assets/images/User.png")),
                    _isDataLoaded
                        ? Text("$userName",
                            style: TextStyle(
                                color: Color(0xFF1D1D1F),
                                fontSize: 10,
                                fontFamily: "Euclid Circular",
                                fontWeight: FontWeight.w100))
                        : Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 75,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                    const Text("Fresher | Level 1",
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                    FilledButton(
                      onPressed: () {
                         print("useremdail"+getUserEmailId);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Edit_Profile_Page();
                        }));
                      },
                      child: const Text("Edit Profile"),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: _btn_color),
                    )
                  ],
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 20, bottom: 20),
                //   // margin: EdgeInsets.only(left: page_size.width *.1,right: page_size.width*.1),
                //   width: page_size.width * 0.8,
                //   height: 100,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 4,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Levels_List_View_container(index: index);
                //     },
                //   ),
                // ),
                Container(
                  width: page_size.width * 0.9,
                  height: 100,
                  child: Row(
                    children: [
                  SizedBox(width: 25,),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFF4ECE9),
                                  child: Image.asset(
                                    "assets/images/conis.png",
                                    width: 30,
                                    height: 30,
                                  )),
                              Text(
                                "Coins",
                                style: TextStyle(),
                              )
                            ],
                          )),
                      SizedBox(width: 10,),
                      Container(
                         padding: EdgeInsets.only(top: 5),
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFF4ECE9),
                                  child: Image.asset(
                                    "assets/images/trophy.png",
                                    width: 40,
                                    height: 40,
                                  )),
                              Text(
                                "Trophy",
                                style: TextStyle(),
                              )
                            ],
                          )),
                      SizedBox(width: 10,),
                      Container(
                         padding: EdgeInsets.only(top: 5),
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFF4ECE9),
                                  child: Image.asset(
                                    "assets/images/shield.png",
                                    width: 40,
                                    height: 40,
                                  )),
                              Text(
                                "Shield",
                                style: TextStyle(),
                              )
                            ],
                          )),
                       SizedBox(width: 10,),
                      Container(
                         padding: EdgeInsets.only(top: 5),
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFF4ECE9),
                                  child: Image.asset(
                                    "assets/images/level.png",
                                    width: 40,
                                    height: 40,
                                  )),
                              Text(
                                "Level",
                                style: TextStyle(),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Card(
                  child: Container(
                    // margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    width: page_size.width * 0.9,
                    color: Colors.white,
                    height: 100,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Streak",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text("0 days reached")
                          ],
                        ),
                        Stack(children: [
                          CircularProgressIndicator(
                            value: 0.01,
                            color: Colors.red,
                            backgroundColor: Colors.grey,
                          ),
                          Image(
                            image: AssetImage("assets/images/mdi_fire.png"),
                            width: 33,
                          )
                        ]),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: page_size.width * 0.9,
                  margin: EdgeInsets.only(top: 20),
                  height: 100,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Extra_List_View(index: index);
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Progress_report();
                    }));
                  },
                  child: Card(
                    child: Container(
                        // margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        width: page_size.width * 0.9,
                        color: Colors.white,
                        height: 100,
                        child: Progress_CardView()),
                  ),
                ),
                Card(
                  child: Container(
                    // margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    width: page_size.width * 0.9,
                    color: Colors.white,
                    height: 100,
                    child: Vocabulary_CardView(),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 20),
                  child: Container(
                    // margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    width: page_size.width * 0.9,
                    color: Color(0xFFE0EEF7),
                    height: 400,
                    child: Doubt_CardView(),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFFFDECE1),
                    ),
                    // margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
      
                    width: page_size.width * 0.9,
                    height: 150,
                    child: Invite_CardView(),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 20),
                  child: Container(
                    // margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFF5F80FC),
                    ),
                    padding: EdgeInsets.all(10),
                    width: page_size.width * 0.9,
                    height: 90,
                    child: Rate_CardView(),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  child: Container(
                    // margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    width: page_size.width * 0.9,
                    height: 100,
                    child: Social_CardView(),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
