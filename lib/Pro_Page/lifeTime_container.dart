import 'package:flutter/material.dart';

class LifeTime extends StatelessWidget {
  const LifeTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      width: 110,
      height: 140,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "₹5100",
            style: TextStyle(fontFamily: 'Euclid Circular',
                fontSize: 20,
                color: Color(0xFFF57952),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Vaild for lifetime.\nNo renewal",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Euclid Circular',fontSize: 10, color: Colors.grey),
          ),
          Divider(
            color: Color(0xFFF57952),
          ),
          Text(
            "Lifetime",
            style: TextStyle(fontFamily: 'Euclid Circular',
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
          )
        ],
      ),
    );
  }
}
