import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Grammar_check_cardview extends StatefulWidget {
  const Grammar_check_cardview({super.key});

  @override
  State<Grammar_check_cardview> createState() => _Grammar_check_cardviewState();
}

class _Grammar_check_cardviewState extends State<Grammar_check_cardview> {
  bool isBtnClicked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      decoration: const BoxDecoration(
          color: const Color(0xFFE5D9FF),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grammar Check",
                    style: TextStyle(
                        fontFamily: "Euclid Circular",
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "यहां 2 सिक्कों से अपना व्याकरण जांचें",
                    style: TextStyle(
                        fontFamily: "Euclid Circular",
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Image.asset("assets/images/grammarIcon.png"),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: _buildGrammarCheckCard(),
                      constraints: const BoxConstraints(
                        minHeight: 150, // Set the minimum height to 100 pixels
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 150,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      child: Image.asset(
                        "assets/images/speaker.png",
                        width: 20,
                        height: 20,
                      ),
                      visible: false,
                    ),
                    Image.asset(
                      "assets/images/copy_clip.png",
                      width: 20,
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/delete_bin.png",
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20.0),
          if (isBtnClicked == true) _showDialobox(),

          // corrected box

          //     const SizedBox(height: 30.0),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isBtnClicked = true;
                });

                print("isBtnClicked" + isBtnClicked.toString());
              },
              child: FittedBox(
                child: Card(
                  color: const Color(0xFFF67952),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10.0),
                        const Text(
                          "Check 2",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Image.asset(
                          'assets/images/conis.png',
                          width: 30.0,
                          height: 35.0,
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          const Center(
            child: Text(
              'Previous Answers',
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Color(0xFFF67952),
                decorationThickness: 3,
                color: Color(0xFFF67952),
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    ));
  }

  Widget _buildGrammarCheckCard() {
    return const Column(
      children: [
        TextField(
            decoration: InputDecoration(
              hintText: 'Type here in English...',
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
            maxLines: 6,
            style: TextStyle(
              fontSize: 12,
            )),

// Add icons for speaker, copy, delete below if needed
      ],
    );
  }

  Widget _buildCorrectedSentencesCard() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Correct answer will be shown here.',
        fillColor: Color(0xFFA9A0BF),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
    );
  }

  Widget _showDialobox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 60,
          child: Card(
            color: const Color(0xFFA9A0BF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: _buildCorrectedSentencesCard(),
                constraints: const BoxConstraints(
                  minHeight: 150, // Set the minimum height to 100 pixels
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/speaker.png",
                width: 20,
                height: 20,
              ),
              Image.asset(
                "assets/images/copy_clip.png",
                width: 20,
                height: 20,
              ),
              Image.asset(
                "assets/images/delete_bin.png",
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
