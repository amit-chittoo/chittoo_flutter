import 'package:chittoo/New_MOT/speechTotext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Home_pages/ListView_Builders/Shurucare_Home_Page/Shurucare_home_Page.dart';

class MOT1_CardView extends StatefulWidget {
  const MOT1_CardView({super.key});

  @override
  State<MOT1_CardView> createState() => _MOT1_CardViewState();
}

class _MOT1_CardViewState extends State<MOT1_CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFEDDA),
      elevation: 3,
      child: Container(
          padding:
              const EdgeInsets.only(bottom: 10, left: 10, top: 10, right: 10),
          decoration: const BoxDecoration(
              color: Color(0xFFFFEDDA),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Chat with Chittoo",
                style: TextStyle(
                    fontFamily: "Euclid Circular",
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              //asdfghjkl
              const Text(
                "हर दिन एक नए विषय पे चैट करें।",
                style: TextStyle(
                    fontFamily: "Euclid Circular",
                    fontSize: 15,
                    fontWeight: FontWeight.w100),
              ),

              // Topic Name
              const Padding(
                padding:
                    EdgeInsets.only(bottom: 10.0, left: 5, right: 5, top: 20),
                child: Text(
                  "My Best Friend",
                  style: TextStyle(
                      color: Color(0xFFF57952),
                      fontFamily: "Euclid Circular",
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/chittoo_logo.png",
                    fit: BoxFit.fill,
                    width: 30,
                    height: 30,
                  ),
                  Container(
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(3),
                        child: SvgPicture.asset(
                          "assets/images/Shape.svg",
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    constraints: const BoxConstraints(
                      minHeight: 50, // Set the minimum height to 100 pixels
                    ),
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      margin: EdgeInsets.zero,
                      child: Stack(children: [
                        Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationX(3),
                            child: SvgPicture.asset(
                              fit: BoxFit.fill,
                              "assets/images/Main In.svg",
                            )),
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: const Text(
                            "How you been to Barilly?",
                            style: TextStyle(
                                fontFamily: "Euclid Circular",
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      child: Stack(children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-1.0, 1.0),
                          child: SvgPicture.asset(
                            fit: BoxFit.fill,
                            "assets/images/Main In.svg",
                          ),
                        )
                      ]),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    color: Colors.transparent,
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.rotationY(3),
                      child: SvgPicture.asset(
                        "assets/images/Shape.svg",
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/User.png",
                    fit: BoxFit.fill,
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FittedBox(
                  // width: 100,
                  // height: 30,
                  child: FilledButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF57952)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return  SpeakToText();
                        }));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Start Chat",
                            style: TextStyle(
                                fontFamily: "Euclid Circular",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.play_circle,
                            size: 30,
                          )
                        ],
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
