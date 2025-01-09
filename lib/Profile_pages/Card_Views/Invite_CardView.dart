import 'package:flutter/material.dart';

class Invite_CardView extends StatefulWidget {
  const Invite_CardView({super.key});

  @override
  State<Invite_CardView> createState() => _Invite_CardViewState();
}

class _Invite_CardViewState extends State<Invite_CardView> {
  @override
  Widget build(BuildContext context) {
    Color _btn_color = const Color(0xFFF57952);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Chittoo Invitation",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17),
            ),
            const Text(
              "Invite friends and get 15 coins",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              width: 80,
              height: 30,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: FilledButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _btn_color,
                    // Background color
                  ),
                  onPressed: () {},
                  child: const Text(
                    "INVITE",
                    style: TextStyle(fontSize: 10),
                  )),
            ),
          ],
        ),
        const Image(
          image: AssetImage("Images/Refer a friend-bro 1.png"),
          fit: BoxFit.fill,
          width: 130,
        ),
      ],
    );
  }
}
