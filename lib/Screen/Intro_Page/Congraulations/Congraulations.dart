import 'package:chittoo/Home_pages/Home_page.dart';
import 'package:chittoo/Models/UserDetailsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CongraulationsPage extends StatefulWidget {
  final bool isFromSignUp;
  const CongraulationsPage({Key? key, required this.isFromSignUp})
      : super(key: key);
  @override
  _CongraulationsState createState() => _CongraulationsState();
}

class _CongraulationsState extends State<CongraulationsPage> {
  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchAndDisplayUserData();
  }

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SafeArea(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
              // width: double.infinity,
              child: Image.asset(
            'assets/images/earned_coins_svg.png',
            height: 300,
            width: 300,
          )),
          SizedBox(
            height: 30,
          ),
          widget.isFromSignUp
              ? Text(
                  "Welcome back",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              : Text(
                  "You have earned\n  chittoo coins.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
          SizedBox(height: 10),
          widget.isFromSignUp
              ? Text(
                  "Your total coins",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              : Text(
                  "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 80,
            width: 140,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.4),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "100",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF57952)),
                ),
                SizedBox(
                  width: 3,
                ),
                Image.asset(
                  'assets/images/coin_card_icon.png',
                  height: 30,
                  width: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Use these coins to:",
            style: TextStyle(
                color: Color(0xFFF57952),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset(
                      "assets/images/tick_green.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  widget.isFromSignUp
                      ? Text("Unlock Topics",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))
                      : Text("Unlock courses",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))
                ],
              ),
              SizedBox(
                width: 80,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset(
                      "assets/images/tick_green.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Text("Check Answers",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Image.asset(
                  "assets/images/tick_green.png",
                  height: 20,
                  width: 20,
                ),
              ),
              widget.isFromSignUp
                  ? Text("Teacher Feedback",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                  : Text("Talk to experts",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
            ],
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home_page())),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFF57952),
              ),
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ))),
    );
  }
}

Future<void> fetchAndDisplayUserData() async {
  UserDetailsModel? user = await fetchUserData();

  if (user != null) {
    print('User UID: ${user.uid}');
    print('User Email: ${user.email}');
    print('User Coins: ${user.coins}');
    print('User lastLoginTime: ${user.lastLogin}');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('coins1', user.coins);
    await prefs.setString('lastLogin', user.lastLogin);
    await prefs.setString('user.email', user.email);
    await prefs.setString('userId', user.uid);

    await prefs.setString('username', user.username);
  } else {
    print('No user data available');
  }
}

Future<UserDetailsModel?> fetchUserData() async {
  try {
    // Get the current user ID (UID) from FirebaseAuth
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Fetch the user data from Realtime Database
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('users').child(userId);
    DatabaseEvent event = await userRef.once();

    if (event.snapshot.exists) {
      // Convert the dynamic snapshot value to a Map<String, dynamic>
      final data = Map<String, dynamic>.from(event.snapshot.value as Map);

      // Map the data to the UserDetailsModel
      UserDetailsModel user =
          UserDetailsModel.fromRealtimeDatabase(userId, data);
      print("User Data Fetched: " + user.email.toString());
      return user;
    } else {
      print('User data not found');
      return null;
    }
  } catch (e) {
    print('Error fetching user data: $e');
    return null;
  }
}
