
import 'package:chittoo/Pro_Page/chittoo_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: const Image(
                          image: AssetImage("Images/User.png"),
                          width: 50,
                        )),

                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Good AfterNoon",
                              style: TextStyle(
                                  color: Color(0xFF1D1D1F),
                                  fontSize: 15,
                                  fontFamily: "Euclid Circular",
                                  fontWeight: FontWeight.w700)),
                          Text("Praveen B | Level 1",
                              style: TextStyle(
                                  color: Color(0xFF1D1D1F),
                                  fontSize: 10,
                                  fontFamily: "Euclid Circular",
                                  fontWeight: FontWeight.w100))
                        ],
                      ),
                    ),

                    // Pro button
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 10),
                      width: 75,
                      height: 25,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                      image:
                                          AssetImage("Images/pro crown.png")))
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
                                      "Images/notification.png",
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 252, 244, 227)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "Images/icons/stargorup.svg",
                              width: 40,
                              height: 40,
                            ),
                            // Image(
                            //   image: AssetImage("Images/mdi_fire.png"),
                            //   width: 33,
                            // ),
                            const SizedBox(
                              width: 9,
                            ),
                            const Text(
                              "Grammar\nChecker",
                              style: TextStyle(
                                  color: Color(0xFF1D1D1F),
                                  fontSize: 15,
                                  fontFamily: "Euclid Circular",
                                  fontWeight: FontWeight.w100),
                              softWrap: true,
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 90,
                        margin:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 211, 220, 228)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "Images/icons/translate.svg",
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Translate\nto English",
                              style: TextStyle(
                                  color: Color(0xFF1D1D1F),
                                  fontSize: 15,
                                  fontFamily: "Euclid Circular",
                                  fontWeight: FontWeight.w100),
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 209, 203, 227)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "Images/icons/chatmot1.svg",
                              width: 40,
                              height: 40,
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
                                  fontWeight: FontWeight.w100),
                              softWrap: true,
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 90,
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 234, 202, 204)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "Images/icons/grammarbook.svg",
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            const Text(
                              "Grammar\nBook",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color(0xFF1D1D1F),
                                  fontSize: 15,
                                  fontFamily: "Euclid Circular",
                                  fontWeight: FontWeight.w300),
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
                            const Text("Unlock Chittoo Premium to unlock all\n"
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
                                              "Images/pro crown.png"),
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
                          image: AssetImage("Images/Group.png"),
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
    );
  }
}
