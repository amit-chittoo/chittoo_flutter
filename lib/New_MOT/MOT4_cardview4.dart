import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MOT4_cardView extends StatefulWidget {
  const MOT4_cardView({super.key});

  @override
  State<MOT4_cardView> createState() => _MOT4_cardViewState();
}

class _MOT4_cardViewState extends State<MOT4_cardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFEAEAEA),
      elevation: 3,
      child: Container(
          padding:
              const EdgeInsets.only(bottom: 10, left: 10, top: 20, right: 10),
          decoration: const BoxDecoration(
              color: const Color(0xFFEAEAEA),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daily Reading Practice",
                style: TextStyle(
                    fontFamily: "Euclid Circular",
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                "Read these lines to build fluency",
                style: TextStyle(
                    fontFamily: "Euclid Circular",
                    fontSize: 14,
                    fontWeight: FontWeight.w100),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 5,
                    color: const Color(0xFFF67952),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 5,
                    color: const Color(0xFF89898D),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 5,
                    color: const Color(0xFF89898D),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "Questions",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Euclid Circular",
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Center(
                child: Container(
                    width: 50,
                    height: 90,

                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 252, 244, 227)),
                    child:  SvgPicture.asset(
                      "Images/icons/stargorup.svg",
                      width: 40,
                      height: 40,
                    ),),
              ),

              const SizedBox(
                height: 30,
              ),
              Center(
                child: FittedBox(
                  child: Card(
                    color: const Color(0xFFF67952),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Press & speak",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
