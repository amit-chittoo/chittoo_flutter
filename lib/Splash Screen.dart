
import 'package:flutter/material.dart';

import 'Log_In_Pages/Log_In_Page.dart';

class Splash_Screens extends StatefulWidget {
  final index;
  final pageController;

  Splash_Screens({super.key, this.index, this.pageController});

  @override
  State<Splash_Screens> createState() => _Splash_ScreensState();
}

class _Splash_ScreensState extends State<Splash_Screens> {
  int _page_no = 1;
  int width=200;
  final List<String> _desp1 = [
    "Pratice English from\n100+ real-life topics",
    "Speak. Think. Read.\n Write. Listen",
    "Customised Lesson Plan"
  ];
  final List<String> _desp2 = [
    "We have a topic for every situation \nin your life. New topic added \nevery week",
    "Easy 5 step lesson plan. Also correct\nyour grammer, build vocabulary, pratice speaking and more",
    "A.I generated custom lessons as per\nyour need and requirement.\nStart speaking with confidence !"
  ];
  final List<String> _image_url = [
    "assets/images/happy_groupmates_meet.png",
    "assets/images/intro2.png",
    "assets/images/intro3.png"
  ];
  Color _btn_color = const Color(0xFFF57952);
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text((widget.index! + 1).toString() + "/3"),
              GestureDetector(
                onTap: () {Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Log_In()),
                        (route) => false);},
                child: const Text("Skip"),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Image(
            image: AssetImage(_image_url[widget.index]),
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width * 0.9,
            height: 200,
          ),
          const SizedBox(height: 80),
          Text(_desp1[widget.index]),
          const SizedBox(height: 20),
          Text(
            _desp2[widget.index],
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),

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
                    if (widget.index == 2) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Log_In()),
                          (route) => false);
                      print("in if");
                    }
                    else
                      {
                        print(widget.index);
                        print(index);
                        index =widget.index+1;


                        widget.pageController.animateToPage(
                          (index),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,

                        );

                        print(widget.index);
                        print(index);

                      }

                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.index != 2
                        ? const Text(
                            "Next",
                            style: TextStyle(fontSize: 20),
                          )
                        : const Text(
                            "Get Started",
                            style: TextStyle(fontSize: 20),
                          ),
                    if (widget.index == 0)
                      const Icon(Icons.navigate_next)
                    else if (widget.index == 1)
                      const Row(
                        children: [
                          Icon(Icons.navigate_next),
                          Icon(Icons.navigate_next),
                        ],
                      )
                    else if (widget.index == 2)
                      const Row(
                        children: [
                          Icon(Icons.navigate_next),
                          Icon(Icons.navigate_next),
                          Icon(Icons.navigate_next),

                        ],
                      )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
