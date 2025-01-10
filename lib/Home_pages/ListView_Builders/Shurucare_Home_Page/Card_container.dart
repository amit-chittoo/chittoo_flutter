import 'package:flutter/material.dart';

class Card_Container extends StatefulWidget {
  final index;

  const Card_Container({super.key, this.index});

  @override
  State<Card_Container> createState() => _Card_ContainerState();
}

class _Card_ContainerState extends State<Card_Container> {
  List<String> _names = [
    "Conversation",
    "Grammer Practice",
    "Vocabulary",
    "Reading",
    "Speaking"
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 130,
        child: Stack(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/chat_icon.png"),
                      fit: BoxFit.fill,
                      width: 50,
                      height: 50,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Color(0xFFF57952),
                          size: 13,
                        ),
                        Text(
                          "10:00 Min",
                          style:
                              TextStyle(fontSize: 10, color: Color(0xFFF57952)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        _names[widget.index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "hindi Text......",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    widget.index == 0
                        ? Container(
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 50,
                            height: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/trophy.png"),
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 50,
                            height: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("0"),
                                Image(
                                  image: AssetImage("assets/images/conis.png"),
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ],
            ),
            ////////

            Align(
                alignment: Alignment.centerRight,
                child: Image(
                  image: AssetImage("assets/images/play.png"),
                  width: 30,
                  fit: BoxFit.contain,
                ))
          ],
        ),
      ),
    );
  }
}
