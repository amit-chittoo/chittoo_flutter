
import 'package:flutter/material.dart';

import 'leaderboard/leaderboard_card_view.dart';

class Leader_board extends StatefulWidget {
  const Leader_board({super.key});

  @override
  State<Leader_board> createState() => _Leader_boardState();
}

class _Leader_boardState extends State<Leader_board> {
  DateTime _today_date = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF57952),
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
          "Leaderboard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
                color: Color(0xFFF57952),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text(
                      "This Week",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    height: 5,
                    thickness: 3,
                    endIndent: MediaQuery.of(context).size.width * 0.85,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 200,
                      child: const Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/User.png"),
                                  width: 70,
                                ),
                                Text(
                                  "User Name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "2nd",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                    image: AssetImage("assets/images/pro crown.png")),
                                SizedBox(
                                  height: 10,
                                ),
                                Image(
                                  image: AssetImage("assets/images/User.png"),
                                  width: 100,
                                ),
                                Text(
                                  "User Name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "1st",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/User.png"),
                                  width: 70,
                                ),
                                Text(
                                  "User Name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "3rd",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return LeaderBoard_CardView(index: index);
              },
            ),
          ))
        ]),
      ),
    );
  }

  void checkTrendingLeaderboard() {
    // FirebaseDatabase.instance.ref("leaderboard").child(path)
  }
}
