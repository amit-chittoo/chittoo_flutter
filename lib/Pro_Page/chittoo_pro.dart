
import 'package:chittoo/Pro_Page/Yearly.dart';
import 'package:chittoo/Pro_Page/coins_card.dart';
import 'package:chittoo/Pro_Page/lifeTime_container.dart';
import 'package:chittoo/Pro_Page/student_offer.dart';
import 'package:flutter/material.dart';

class Chittoo_Pro extends StatefulWidget {
  const Chittoo_Pro({super.key});

  @override
  State<Chittoo_Pro> createState() => _Chittoo_ProState();
}

class _Chittoo_ProState extends State<Chittoo_Pro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFFF4F4F4),
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_outlined),
                          color: const Color(0xFFF57952),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    const Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("Images/pro crown.png"),
                              color: Color(0xFFF57952),
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Chittoo Pro",
                              style: TextStyle(
                                  fontFamily: 'Euclid Circular',
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              // Chitto Pro and crown widgets

              SizedBox(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 150,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xffFBED96),
                            Color(0xffABECD6),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 10, left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "₹799",
                                  style: TextStyle(
                                      fontFamily: 'Euclid Circular',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFF57952)),
                                ),
                                const Text(
                                  "*Save 60%",
                                  style: TextStyle(
                                      fontFamily: 'Euclid Circular',
                                      fontWeight: FontWeight.w500),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Expires in ',
                                          style: TextStyle(
                                              fontFamily: 'Euclid Circular',
                                              fontSize: 13,
                                              color: Colors.grey)),
                                      TextSpan(
                                          text: '7 Days',
                                          style: TextStyle(
                                              fontFamily: 'Euclid Circular',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFF57952),
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: FilledButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFF57952),
                                        // Background color
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return const Chittoo_Pro();
                                        }));
                                      },
                                      child: const Text(
                                        "Learn more",
                                        style: TextStyle(
                                            fontFamily: 'Euclid Circular',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 5,
                              left: 90,
                              child: Text(
                                "*Special Offer",
                                style: TextStyle(
                                    fontFamily: 'Euclid Circular',
                                    fontSize: 13,
                                    color: Colors.green),
                              )),
                          // Image has to be added ........
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Choose a Plan. Enjoy Pro.",
                          style: TextStyle(
                              fontFamily: 'Euclid Circular',
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [LifeTime(), Yearly(), Student_offer()],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Coin Pack"),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 500,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Coins_card(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
            ),
          )),
    );
  }
}
