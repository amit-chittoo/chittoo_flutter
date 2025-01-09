import 'package:flutter/material.dart';

class Student_offer extends StatelessWidget {
  const Student_offer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: 110,
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "₹749",
                style: TextStyle(
                    fontFamily: 'Euclid Circular',
                    fontSize: 20,
                    color: Color(0xFFF57952),
                    fontWeight: FontWeight.bold),
              ),
              Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "₹999",
                    style: TextStyle(
                        fontFamily: 'Euclid Circular',
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 30,
                  child: Container(
                    width: 50,
                    child: Transform.rotate(
                        angle: 50,
                        child: Divider(
                          thickness: 3,
                        )),
                  ),
                )
              ]),
              Text(
                "Vaild for 1 year.\nSubmit your ID copy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Euclid Circular',
                    fontSize: 10,
                    color: Colors.grey),
              ),
              Divider(
                color: Color(0xFFF57952),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Student offer",
                    style: TextStyle(
                        fontFamily: 'Euclid Circular',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: 70,
          child: Image(
            image: AssetImage("Images/Rectangle 23847.png"),
            fit: BoxFit.fill,
            width: 40,
            height: 38,
          ),
        ),
        Positioned(
          top: 120,
          left: 87,
          child: Transform.rotate(
            angle: -45,
            child: Text(
              "-63%",
              style: TextStyle(
                  fontFamily: 'Euclid Circular',
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
