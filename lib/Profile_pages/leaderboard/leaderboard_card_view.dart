import 'package:flutter/material.dart';

class LeaderBoard_CardView extends StatelessWidget {
  int index;

  LeaderBoard_CardView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.red,
                    width: 4.0,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/User.png"),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text("User Name"),
            ],
          ),
          Align(
            child: Text(
              (index + 4).toString() + "th",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
