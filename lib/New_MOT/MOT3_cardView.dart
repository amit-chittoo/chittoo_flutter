import 'package:flutter/material.dart';

class MOT_3_cardview extends StatefulWidget {
  const MOT_3_cardview({super.key});

  @override
  State<MOT_3_cardview> createState() => _MOT_3_cardviewState();
}

class _MOT_3_cardviewState extends State<MOT_3_cardview> {
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
                "Vocabulary",
                style: TextStyle(
                    fontFamily: "Euclid Circular",
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
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
              // Topic Name
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      "Option 1",
                      style: TextStyle(
                          fontFamily: "Euclid Circular",
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        "Option 2",
                        style: TextStyle(
                            fontFamily: "Euclid Circular",
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ],
          )),
    );
  }
}
