import 'package:chittoo/Pro_Page/chittoo_pro.dart';
import 'package:chittoo/Profile_pages/Edit_Profile_pages/Edit_profile.dart';
import 'package:chittoo/globals.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Banner_CardViews/Jam_master.dart';
import '../Banner_CardViews/Vocabulary.dart';
import '../Grammer_check/Grammer_check_cardview.dart';
import '../New_MOT/MOT3_cardView.dart';
import '../New_MOT/MOT4_cardview4.dart';
import '../New_MOT/MOT_1_cardview.dart';
import '../ads_container.dart';
import 'Extra_view_Page_view.dart';
import 'ListView_Builders/Course_Page_view.dart';
import 'ListView_Builders/Shurucare_Home_Page/topic_card_container_new.dart';

class Home_pageview extends StatefulWidget {
  final page_controller;
  final selectedIndex;

  Home_pageview(
      {super.key, required this.page_controller, required this.selectedIndex});

  @override
  State<Home_pageview> createState() => _Home_pageviewState();
}

class _Home_pageviewState extends State<Home_pageview> {
  final _page_controller = PageController();
  final _page_controller_course = PageController();
  bool _continue_topic_visiblilty = true;
  Color _myColor = const Color(0xC7F7F7F7);
  Color _btn_color = const Color(0xFFF57952);
  final List<String> _btn_names = ["Office"];
  final List<String> _btn_desp = [
    "First Day in Office",
    "Opening a Bank",
    "Job Interview",
    "Airport Chat"
  ];
  String? userName;
  String? greetingWish;
  bool _isDataLoaded = false;
  String? userId;

  void getUserdata() async {
    final sf = await SharedPreferences.getInstance();
    userName = sf.getString("username");
    print("objectusername" + userName.toString());
    userId = sf.getString("userId");
    setState(() {
      _isDataLoaded = true;
    });
    checkUsername(context);
  }

  void checkUsername(BuildContext context) {
    if (userName == null || userName == "Username") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController textController = TextEditingController();
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Center(
                child: Text(
              'Enter Name!',
              style: TextStyle(
                  color: Color(0xFFF57952), fontWeight: FontWeight.bold),
            )),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xFFF57952), 
                            width: 0.8, 
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xFFF57952), 
                            width: 0.8, )
                        ),
                        hintText: "Please type your full name here",
                        hintStyle: TextStyle(fontSize: 14),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {}); // Trigger a UI rebuild
                      },
                    ),
                  ],
                );
              },
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    if (textController.text.isEmpty) {
                      // Do not close the dialog and show validation
                      return;
                    }
                    Navigator.of(context).pop();
                    // Handle valid username input
                    print("Entered Username: ${textController.text}");
                    String enteredUsername = textController.text;
                    print("Entered Username2: ${enteredUsername}");
                    // print("Entered Username3: ${username}");
                    DatabaseReference ref =
                        FirebaseDatabase.instance.ref('users/$userId');

                    ref.update({
                      'name': enteredUsername,
                    });

                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('username', enteredUsername);
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Color(0xFFF57952),
                          borderRadius: BorderRadius.circular(40)),
                          child: Center(child: Text("Next",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                    ),
                  )),
            ],
          );
        },
      );
    }
  }

  void getCurrentTime() {
    DateTime currentTime = DateTime.now();
    if (currentTime.hour < 12) {
      greetingWish = "Good Morning";
    } else if (currentTime.hour < 18) {
      greetingWish = "Good Afternoon";
    } else {
      greetingWish = "Good Evening";
    }
  }

  @override
  void initState() {
    super.initState();
    getUserdata();
    
    getCurrentTime();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Returning false blocks the back button.
        return false;
      },
      child: SafeArea(
        child: Container(
          color: const Color(0xFFF4F4F4),
          width: MediaQuery.of(context).size.width - 10,
          height: MediaQuery.of(context).size.height - 10,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top bar (user name pro btn and notificiation icon)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Edit_Profile_Page())),
                        child: Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Color(0xFFF67952), width: 2),
                              ),
                              child: const Image(
                                image: AssetImage("assets/images/User.png"),
                                width: 50,
                            )),
                      ),),

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(greetingWish.toString(),
                                style: TextStyle(
                                    color: Color(0xFF1D1D1F),
                                    fontSize: 15,
                                    fontFamily: "Euclid Circular",
                                    fontWeight: FontWeight.w700)),
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
                          ],
                        ),
                      ),

                      // Pro button
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        width: 75,
                        height: 25,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: FilledButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _btn_color,
                              // Background color
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const Chittoo_Pro();
                              }));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PRO",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Expanded(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/pro crown.png")))
                              ],
                            )),
                      ),

                      //Bell Icons
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            margin: EdgeInsets.only(right: 15, top: 20),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: 50,
                            height: 50,
                            child: Stack(children: [
                              Center(
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: FilledButton(
                                    onPressed: () {
                                      // Navigator.push(context, MaterialPageRoute(
                                      //     builder: (BuildContext context) {
                                      //       return Splash_Screens();
                                      //     }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      // Background color
                                    ),
                                    child: const Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        "assets/images/notification.png",
                                      ),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 5, top: 5),
                                  width: 20.0,
                                  // Circle diameter
                                  height: 20.0,
                                  child: Center(
                                      child: Text(
                                    "3",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Euclid Circular",
                                        fontWeight: FontWeight.w100,
                                        color: Colors.white),
                                  )),
                                  // Circle diameter
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF67952), // Circle color
                                    shape: BoxShape
                                        .circle, // Makes the container a circle
                                  ),
                                ),
                              ),
                            ])),
                      ),
                    ]),

                // Grammer check and translation
                FittedBox(
                  child: Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 90,
                          margin: const EdgeInsets.only(top: 30, left: 20),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 252, 244, 227)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Image.asset("assets/images/stargorup.png",
                             height: 50,
                             width: 50,
                             ),
                              // Image(
                              //   image: AssetImage("assets/images/mdi_fire.png"),
                              //   width: 33,
                              // ),
                              const SizedBox(
                                width: 9,
                              ),
                              const Text(
                                "Sentence\nChecker",
                                style: TextStyle(
                                    color: Color(0xFF1D1D1F),
                                    fontSize: 15,
                                    fontFamily: "Euclid Circular",
                                    ),
                                softWrap: true,
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 90,
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 211, 220, 228)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/translate.png",
                             height: 50,
                             width: 50,
                             ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Translate\nto English",
                                style: TextStyle(
                                    color: Color(0xFF1D1D1F),
                                    fontSize: 15,
                                    fontFamily: "Euclid Circular",
                                    ),
                                softWrap: true,
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),

                // Chat with chittoo and grammar book
                FittedBox(
                  child: Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 90,
                          margin: const EdgeInsets.only(top: 20, left: 20),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 209, 203, 227)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Image.asset("assets/images/chatmot1.png",
                             height: 50,
                             width: 50,
                             ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Chat with\nChittoo",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF1D1D1F),
                                    fontFamily: "Euclid Circular",
                                    ),
                                softWrap: true,
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 90,
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 234, 202, 204)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/grammarbook.png",
                             height: 50,
                             width: 50,
                             ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Grammar\nBook",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xFF1D1D1F),
                                    fontSize: 15,
                                    fontFamily: "Euclid Circular",
                                  ),
                                softWrap: true,
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Topic_card_container(),

                    // ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: _btn_names.length,
                    //   // Replace with your actual item count
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Topic_card_container(
                    //         index: index,
                    //         viewpager: _page_controller,
                    //         btn_names: _btn_names,
                    //         btn_desp: _btn_desp);
                    //   },
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: MOT1_CardView(),

                    // ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: _btn_names.length,
                    //   // Replace with your actual item count
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Topic_card_container(
                    //         index: index,
                    //         viewpager: _page_controller,
                    //         btn_names: _btn_names,
                    //         btn_desp: _btn_desp);
                    //   },
                    // ),
                  ),
                ),
                const Jam_master_banner(),
                FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: MOT_3_cardview(),
                  ),
                ),
                FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Grammar_check_cardview(),
                  ),
                ),

                const Vocabulary_banner(),

                FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: MOT4_cardView(),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width - 30,
                  height: 300,
                  child: PageView.builder(
                    itemCount: 3,
                    controller: _page_controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Contest_PageView(index: index);
                    },
                  ),
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: _page_controller,
                    count: 3,
                    onDotClicked: (index) {
                      _page_controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                    effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFFF57952),
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5),
                  ),
                ),
                const Ads_container(),

                const Text(
                  "Course you may like",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _btn_names.length,
                    // Replace with your actual item count
                    itemBuilder: (BuildContext context, int index) {
                      return Course_Page_view(
                          index: index,
                          viewpager: widget.page_controller,
                          selectedIndex: widget.selectedIndex);
                    },
                  ),
                ),
                FittedBox(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 252, 244, 227),
                    ),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 200,
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Chittoo Premium",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                              const Text(
                                  "Unlock Chittoo Premium to unlock all\n"
                                  "features."),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                ),
                                width: 100,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: FilledButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _btn_color,
                                      // Background color
                                    ),
                                    onPressed: () {},
                                    child: FittedBox(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Go Pro",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image(
                                            image: AssetImage(
                                                "assets/images/pro crown.png"),
                                            width: 15,
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          const Image(
                            width: 100,
                            image: AssetImage("assets/images/Group.png"),
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
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
