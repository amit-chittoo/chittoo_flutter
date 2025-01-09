import 'package:flutter/material.dart';

class Yearly extends StatelessWidget {
  const Yearly({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: 140,
          height: 160,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFF57952),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                width: 140,
                height: 30,
                child: const Center(
                  child: Text(
                    style: TextStyle(
                      fontFamily: 'Euclid Circular',
                    ),
                    "Best Buy",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Text(
                "₹999",
                style: TextStyle(
                    fontFamily: 'Euclid Circular',
                    fontSize: 20,
                    color: Color(0xFFF57952),
                    fontWeight: FontWeight.bold),
              ),
              Stack(children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "₹2000",
                    style: TextStyle(
                        fontFamily: 'Euclid Circular',
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 42,
                  child: Container(
                    width: 50,
                    child: Transform.rotate(
                        angle: 50,
                        child: const Divider(
                          thickness: 3,
                        )),
                  ),
                )
              ]),
              const Text(
                "Vaild for 365 \ndays",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Euclid Circular',
                    fontSize: 10,
                    color: Colors.grey),
              ),
              const Divider(
                color: Color(0xFFF57952),
              ),
              const Text(
                "Yearly",
                style: TextStyle(
                    fontFamily: 'Euclid Circular',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
