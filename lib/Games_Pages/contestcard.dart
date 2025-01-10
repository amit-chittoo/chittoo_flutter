
import 'package:flutter/material.dart';

import 'Contest_Page.dart';

class Contest_card_View extends StatefulWidget {
  const Contest_card_View({super.key});

  @override
  State<Contest_card_View> createState() => _Contest_card_ViewState();
}

class _Contest_card_ViewState extends State<Contest_card_View> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.9,
      height: 510,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/chittoo.png",
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        "Answer Do Cash Jeeto Contest",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Win Rs 100/- cash prize everyday. T&C Apply",
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                "assets/images/contest_image.png",
                fit: BoxFit.cover,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
                height: 300,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
            child: const Row(
              children: [
                Icon(
                  Icons.perm_identity,
                  color: Color(0xFFF57952),
                ),
                Text("7"),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.share_arrival_time,
                  color: Color(0xFFF57952),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("time"),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage(
                        "assets/images/User.png",
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(
                          "assets/images/User.png",
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(
                          "assets/images/User.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Names.......")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: FilledButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return Contest_Page();
                    }));
              },
              child: Text(
                "Join Now",
                style: TextStyle(color: Colors.white),
              ),
              style:
              ElevatedButton.styleFrom(backgroundColor: Color(0xFFF57952)),
            ),
          )
        ],
      ),
    );
  }
}
