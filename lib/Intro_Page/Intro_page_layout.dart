
import 'package:flutter/material.dart';

import '../Log_In_Pages/Log_In_Page.dart';

class Intro_page_layout extends StatefulWidget {
  const Intro_page_layout({super.key});

  @override
  State<Intro_page_layout> createState() => _Intro_page_layoutState();
}

class _Intro_page_layoutState extends State<Intro_page_layout> {
  int _page_no = 0;

  final List<String> _image_list = [
    "happy_groupmates_meet_after_holidays__shake_hands__agree_to_work_together_as_team__stand_in_profile__lovely_woman_with_headphones_meets_friend__unshaven_young_man_holds_notepad_talks_with_female.png",
    "intro2.png",
    "intro3.png"
  ];
  final List<String> _intro_header_text = [
    "Practice English from 100+ real-life topics  ",
    "Speak. Think. Read. Write. Listen.",
    "Customised Lesson Plan"
  ];
  final List<String> _intro_sub_text = [
    "We have a topic for every situation in your life.New topic added every week.",
    "Easy 5 steps lesson plan. Also correct your grammar, build vocabulary, practice speaking and more.",
    "A.I. generated custom lessons as per your need and requirement. Start speaking with confidence"
  ];

  final Color _btn_color = const Color(0xFFF57952);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black, fontFamily: "Euclid Circular",
                          fontWeight: FontWeight.w300,
                          // Set the default color for the text
                          fontSize: 16, // Set the default font size
                        ),
                        children: [
                          TextSpan(text: "${_page_no + 1}"),
                          // Dynamic page number
                          const TextSpan(
                              text: "/3",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Euclid Circular",
                                  fontWeight: FontWeight.w300)),
                          // Static total page number
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Log_In()),
                              (route) => false);
                        });
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontFamily: "Euclid Circular",
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          // Set the color of the skip text
                          fontSize: 16, // Set the font size of the skip text
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70),
                child: Image.asset(
                  "assets/images/${_image_list[_page_no]}",
                  width: MediaQuery.of(context).size.width - 30,
                  fit: BoxFit.fill,
                  height: 200,
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 40,
                      left: MediaQuery.of(context).size.width / 5,
                      right: MediaQuery.of(context).size.width / 5),
                  child: Text(
                    _intro_header_text[_page_no],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Euclid Circular",
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      // Set the color of the skip text
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 20,
                    left: MediaQuery.of(context).size.width / 5,
                    right: MediaQuery.of(context).size.width / 5),
                child: const Text(
                  "We have a topic for every situation in your life.New topic added every week.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Euclid Circular",
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                    // Set the color of the skip text
                    fontSize: 16,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  width: 200,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: FilledButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _btn_color,
                        // Background color
                      ),
                      onPressed: () {
                        setState(() {
                          if (_page_no < 2) {
                            _page_no++;
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Log_In()),
                                (route) => false);
                          }
                        });
                      },
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _page_no == 2 ? "Get Started" : "Next",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Euclid Circular",
                                  fontWeight: FontWeight.w600),
                            ),
                            _page_no == 0
                                ? const Icon(
                                    Icons.navigate_next,
                                    size: 30,
                                  )
                                : _page_no == 1
                                    ? const FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Wrap(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                              child: Icon(
                                                Icons.navigate_next,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Icon(
                                              Icons.navigate_next,
                                              size: 30,
                                            )
                                          ],
                                        ),
                                      )
                                    : const FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                              child: Icon(
                                                Icons.navigate_next,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                              child: Icon(
                                                Icons.navigate_next,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Icon(
                                              Icons.navigate_next,
                                              size: 30,
                                            )
                                          ],
                                        ),
                                      )

                            // else if (_page_no == 1)
                            //   Icon(
                            //     Icons.navigate_next,
                            //     size: 40,
                            //   ),
                            // Icon(
                            //   Icons.navigate_next,
                            //   size: 40,
                            // )
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
