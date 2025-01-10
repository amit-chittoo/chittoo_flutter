import 'package:flutter/material.dart';

class Question_Page_container extends StatefulWidget {
  const Question_Page_container({super.key});

  @override
  State<Question_Page_container> createState() =>
      _Question_Page_containerState();
}

class _Question_Page_containerState extends State<Question_Page_container> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 10,
          color: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.deepOrange)),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Watch this Video to answer 3 easy questions.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Hindi Text......................."),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        ))
                  ],
                ),
              ),
              Expanded(
                  child: PageView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("Choose the meaning of"),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Word"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              child: Container(
                                width: 150,
                                height: 70,
                                child: Center(child: Text("Option 1")),
                              ),
                            ),
                            Card(
                              child: Container(
                                width: 150,
                                height: 70,
                                child: Center(child: Text("Option 2")),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              child: Container(
                                width: 150,
                                height: 70,
                                child: Center(child: Text("Option 3")),
                              ),
                            ),
                            Card(
                              child: Container(
                                width: 150,
                                height: 70,
                                child: Center(child: Text("Option 4")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: FilledButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF57952)),
                  onPressed: () {},
                  child: Text("Submit and earn one coin"),
                ),
              )
            ]),
          ),
        ),
        SizedBox(height: 20,),
        Text("Suggested for you"),
        SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(right: 10,left: 10),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage("assets/images/Mask Group.png"),
                          fit: BoxFit.fill,width: 200,
                        ),
                        SizedBox(height: 10,),
                        Text("Title")
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 110, top: 95),
                      height: 30,
                      child: FilledButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF57952)),
                          onPressed: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => YouTube_Page()));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Start",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.play_circle,
                                size: 12,
                              )
                            ],
                          )),
                    ),
                    Center(
                      widthFactor: 4,
                      heightFactor: 2,
                      child: Icon(
                        Icons.play_circle_outline_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
