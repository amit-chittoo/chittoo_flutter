import 'package:flutter/material.dart';

class Coins_card extends StatefulWidget {
  final index;

  const Coins_card({this.index, super.key});

  @override
  State<Coins_card> createState() => _Coins_cardState();
}

class _Coins_cardState extends State<Coins_card> {
  final _coins = ["100", "250", "500", "1000"];
  final _amount = ["99", "249", "399", "599"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 100,
      child: Stack(
        children: [
          Row(
            children: [
              Image(
                image: AssetImage("assets/images/conis.png"),
                fit: BoxFit.fill,
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _coins[widget.index] + " Coins",
                    style: TextStyle(fontFamily: 'Euclid Circular',fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  Text(
                    "₹ " + _amount[widget.index],
                    style: TextStyle(fontFamily: 'Euclid Circular',fontWeight: FontWeight.w100, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          ////////

          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF57952),
                  // Background color
                ),
                onPressed: () {},
                child: const Text(
                  "Buy",
                  style: TextStyle(fontFamily: 'Euclid Circular',fontSize: 12, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
