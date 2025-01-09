
import 'package:chittoo/Pro_Page/chittoo_pro.dart';
import 'package:flutter/material.dart';

import 'Course_Pages/Course_Page_viwer.dart';

class Learn_page extends StatefulWidget {
  const Learn_page({super.key});

  @override
  State<Learn_page> createState() => _Learn_pageState();
}

class _Learn_pageState extends State<Learn_page> {
  @override
  Widget build(BuildContext context) {
    Color _btn_color = const Color(0xFFF57952);
    final PageController _course_pagecontroller = PageController();

    return Scaffold(
        body: SafeArea(
            child: Container(
              color: const Color(0xFFF4F4F4),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
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
                            "Learn",
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
                                            return Chittoo_Pro();
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
                                                image:
                                                AssetImage(
                                                    "Images/pro crown.png")))
                                      ],
                                    )),
                              ),

                              //Bell Icons
                              Container(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 25,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(fontSize: 13),
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  labelStyle: TextStyle(fontSize: 13),
                                  border: InputBorder.none,
                                  hintText: 'Search from 100+ Topics'),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.mic_none_outlined)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.search)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("अपना पसंदीदा कोर्स चुनें",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 9,
                        scrollDirection: Axis.vertical,
                        controller: _course_pagecontroller,
                        itemBuilder: (BuildContext context, int index) {
                          return Course_ListPage(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
