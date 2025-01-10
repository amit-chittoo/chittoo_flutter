import 'package:flutter/material.dart';

class Contest_Page extends StatefulWidget {
  const Contest_Page({super.key});

  @override
  State<Contest_Page> createState() => _Contest_PageState();
}

class _Contest_PageState extends State<Contest_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F4F4),
        automaticallyImplyLeading: false,
        leading: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color(0xFFFDECE1),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
              ),
              color: const Color(0xFFF57952),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        centerTitle: true,
        title: const Text(
          "Contest",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: const Color(0xFFF4F4F4),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  height: 400,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      const FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/images/chittoo.png"),
                              // fit: BoxFit.contain,
                              // width: 50,
                              // height: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  child: Text(
                                    "आप इस फोटो में क्या देख रहे हैं?",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "Write a sentence in English, "
                                  "about what you see\n happening in this picture.",
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/contest_image.png",
                            width: MediaQuery.of(context).size.width * 0.8,
                            fit: BoxFit.fill,
                            height: 300,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 390,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                  child:
                                      Text("What do you see in this picture")),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFF2F5FA),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Enter your answer here"),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFF57952),
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Phone"),
                              ),
                              const Text(
                                  '\u2022  Phone number required for UPI Payments'),
                              const Text(
                                  '\u2022  3 lucky winners everyday will win Rs 100'),
                              const Text(
                                  '\u2022  Winners will be announced tomorrow'),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: FilledButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFF57952)),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  "Terms and Conditons",
                                  style: TextStyle(
                                      decorationColor: Color(0xFFF57952),
                                      decoration: TextDecoration.underline,
                                      color: Color(0xFFF57952)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/images/chittoo.png"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
