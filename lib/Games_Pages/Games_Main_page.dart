
import 'package:chittoo/Games_Pages/Learn_new_PageView.dart';
import 'package:chittoo/Games_Pages/contestcard.dart';
import 'package:chittoo/Games_Pages/daily_write_viiew.dart';
import 'package:chittoo/Games_Pages/games_list_vie.dart';
import 'package:chittoo/Games_Pages/learnDailyListModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Pro_Page/chittoo_pro.dart';
import 'Stories_Pages/story_model.dart';

class Games_Main_page extends StatefulWidget {
  const Games_Main_page({super.key});

  @override
  State<Games_Main_page> createState() => _Course_MainPage_ViewState();
}

class _Course_MainPage_ViewState extends State<Games_Main_page> {
  Color _btn_color = const Color(0xFFF57952);
  final _learn_new_controller = PageController();
  List<stories_model> storyModel = [];
  List<learnDailyModel> learmodel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (storyModel.length == 0) {
      storyModel = getStories();
    }

    learmodel = getlearndata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              color: const Color(0xFFF4F4F4),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 10, right: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Games",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Pro button
                                  Container(
                                    width: 75,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: FilledButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _btn_color,
                                          // Background color
                                        ),
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return const Chittoo_Pro();
                                          }));
                                        },
                                        child: const Row(
                                          children: [
                                            Text(
                                              "PRO",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            Expanded(
                                                child: Image(
                                                    image: AssetImage(
                                                        "Images/pro crown.png")))
                                          ],
                                        )),
                                  ),

                                  //Bell Icons
                                  SizedBox(
                                      width: 70,
                                      height: 25,
                                      child: FilledButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          // Background color
                                        ),
                                        child: const Image(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                            "Images/notification.png",
                                          ),
                                          color: Colors.grey,
                                        ),
                                      ))
                                ],
                              ),
                            ]),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .900,
                          height: 70,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Games_listView(
                                  index: index, storiesModel: storyModel);
                            },
                          ),
                        ),
                        Contest_card_View(),
                        Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width * .900,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          height: 500,
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Image(
                                    image: AssetImage("Images/idea.png"),
                                    fit: BoxFit.fill,
                                    width: 25,
                                    height: 35,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Learn something new Today.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width * .900,
                                height: 400,
                                child: PageView.builder(
                                  controller: _learn_new_controller,
                                  itemCount: 2,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Learn_PageViewer(
                                        index: index, learnmodel: learmodel);
                                  },
                                ),
                              ),
                              Center(
                                child: SmoothPageIndicator(
                                  controller: _learn_new_controller,
                                  count: 2,
                                  onDotClicked: (index) {
                                    _learn_new_controller.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 200),
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
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * .900,
                          height: 400,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          child: const Daily_view_page(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(255, 252, 244, 227),
                          ),
                          width: MediaQuery.of(context).size.width - 10,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Today's Quote",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                  const Text("Pratice leads to permanence"),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    width: 100,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: FilledButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _btn_color,
                                          // Background color
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Share Now",
                                          style: TextStyle(fontSize: 10),
                                        )),
                                  ),
                                ],
                              ),
                              const Image(
                                image: AssetImage("Images/Group.png"),
                                fit: BoxFit.fill,
                                width: 100,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ))),
    );
  }


}
