import 'package:flutter/material.dart';

class Ads_container extends StatefulWidget {
  const Ads_container({super.key});

  @override
  State<Ads_container> createState() => _Ads_containerState();
}

class _Ads_containerState extends State<Ads_container> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
        width: MediaQuery.of(context).size.width - 20,
        height: 150,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                elevation: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFCDEBFD),
                  ),

                  width: MediaQuery.of(context).size.width - 50,
                  height: 70,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Watch Ads!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Euclid Circular",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text("To win chittoo coins",style: TextStyle(
                              fontFamily: "Euclid Circular",
                              fontSize: 12,
                              fontWeight: FontWeight.w100),)
                        ],
                      ),

                      // SizedBox(width:150),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Icon(
                          Icons.play_circle,
                          color: Color(0xFFF57952),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
                top: 16,
                child: Image(
                  image: AssetImage("Images/illustration.png"),
                  fit: BoxFit.fill,
                  width: 120,
                  height: 130,
                )),
          ],
        ),
      ),
    );
  }
}
