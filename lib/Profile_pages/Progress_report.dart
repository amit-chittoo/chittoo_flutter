import 'package:flutter/material.dart';

class Progress_report extends StatefulWidget {
  const Progress_report({super.key});

  @override
  State<Progress_report> createState() => _Progress_reportState();
}

class _Progress_reportState extends State<Progress_report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFF4F4F4),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_outlined),
                          color: const Color(0xFFF57952),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Progress Report",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          Card(
                            margin: EdgeInsets.all(20),
                            color: Colors.white,
                            child: Container(
                              height: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 10,
                                        value: 0.00,
                                        color: Color(0xFFF57952),
                                        backgroundColor: Colors.grey,
                                      ),
                                    ),
                                    Positioned(
                                        top: 30,
                                        left: 27,
                                        child: Text(
                                          "80%",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ]),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Great Work",
                                        style: TextStyle(
                                            color: Color(0xFFF57952),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Hey User, Great Work."),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.star,
                              color: Color(0xFFF57952),
                              size: 60,
                            ),
                          )
                        ]),
                        Text("Your Score"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              child: Container(
                                color: Colors.white,
                                width: 170,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.book),
                                    Text("Grammer"),
                                    Text("Score 00%"),
                                    Container(
                                      width: 120,
                                      height: 15,
                                      child: LinearProgressIndicator(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        value: 0,
                                        color: Color(0xFFF57952),
                                        backgroundColor: Color(0xFFFDECE1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                color: Colors.white,
                                width: 170,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.book),
                                    Text("Word Power"),
                                    Text("Score 00%"),
                                    Container(
                                      width: 120,
                                      height: 15,
                                      child: LinearProgressIndicator(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        value: 0,
                                        color: Color(0xFFF57952),
                                        backgroundColor: Color(0xFFFDECE1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              child: Container(
                                color: Colors.white,
                                width: 170,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.book),
                                    Text("Speak"),
                                    Text("Score 00%"),
                                    Container(
                                      width: 120,
                                      height: 15,
                                      child: LinearProgressIndicator(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        value: 0,
                                        color: Color(0xFFF57952),
                                        backgroundColor: Color(0xFFFDECE1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                color: Colors.white,
                                width: 170,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.book),
                                    Text("Think"),
                                    Text("Score 00%"),
                                    Container(
                                      width: 120,
                                      height: 15,
                                      child: LinearProgressIndicator(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        value: 0,
                                        color: Color(0xFFF57952),
                                        backgroundColor: Color(0xFFFDECE1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
