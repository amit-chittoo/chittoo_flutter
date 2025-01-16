import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Shurucare_home_Page.dart';

class Topic_card_container extends StatefulWidget {
  // final int index;
  // final List<String> btn_names;
  //
  // final List<String> btn_desp;
  // final viewpager;

  const Topic_card_container({super.key});

  // const Topic_card_container(
  //     {super.key,
  //     required this.index,
  //     required this.btn_names,
  //     required this.btn_desp,
  //     required this.viewpager});

  @override
  State<Topic_card_container> createState() => _Topic_card_containerState();
}

class _Topic_card_containerState extends State<Topic_card_container> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                    color: Color(0xFFF57952),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        // width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        'https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2F2ehgf5vanj2?alt=media&token=b1ce91e5-ffb1-4ca7-9d79-0e7fac9074c0',
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              color: const Color(0xFFF57952),
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Text('Error loading image');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/images/icons/exerciese_topic.svg"),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "5 Exercises",
                                style: TextStyle(
                                    fontFamily: "Euclid Circular",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),

              // Topic Name
              const Padding(
                padding: EdgeInsets.only(bottom: 5.0, left: 5, right: 5),
                child: Text(
                  "Topic Order return in Online shopping",
                  style: TextStyle(
                      fontFamily: "Euclid Circular",
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              // Topic desp in English
              const Padding(
                padding: EdgeInsets.only(bottom: 5.0, left: 5, right: 5),
                child: Text(
                  "Return order and refund in online shopping",
                  style: TextStyle(
                      fontFamily: "Euclid Circular",
                      fontSize: 14,
                      fontWeight: FontWeight.w100),
                ),
              ),
              // Topic Desp in Hindi
              const Padding(
                padding: EdgeInsets.only(bottom: 5.0, left: 5, right: 5),
                child: Text(
                  "Hindi text ",
                  style: TextStyle(
                      fontFamily: "Euclid Circular",
                      fontSize: 14,
                      fontWeight: FontWeight.w100),
                ),
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
                          return const Shuru_Home_page();
                        }));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Start",
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
