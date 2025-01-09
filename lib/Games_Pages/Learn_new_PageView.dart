import 'package:chittoo/Games_Pages/learnDailyListModel.dart';
import 'package:flutter/material.dart';

class Learn_PageViewer extends StatefulWidget {
  final int index;
  final List<learnDailyModel> learnmodel;

  Learn_PageViewer({super.key, required this.index, required this.learnmodel});

  @override
  State<Learn_PageViewer> createState() => _Learn_PageViewerState();
}

class _Learn_PageViewerState extends State<Learn_PageViewer> {
  @override
  Widget build(BuildContext context) {
    final List<learnDailyModel> learnmodel = widget.learnmodel;

    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: MediaQuery.of(context).size.width * .900,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "More ways to say",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text("Text In Hindi", style: TextStyle(fontSize: 10)),
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.tealAccent,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.deepOrangeAccent,
                    // Set your desired border color
                    width: 1.0, // Set the width of the border
                  ),
                ))),
        Expanded(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("learnmodel.elementAt(index).point1.toString()"),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.volume_up,
                                color: Colors.deepOrangeAccent,
                                size: 15,
                              ))
                        ],
                      ),
                    ),
                    // margin: const EdgeInsets.only(top: 20),
                    height: 55,
                    width: MediaQuery.of(context).size.width * .900,
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Colors.deepOrangeAccent,
                        // Set your desired border color
                        width: 1.0, // Set the width of the border
                      ),
                    )));
              }),
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 20,
                  )),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.thumb_down_alt_outlined,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  size: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    // DatabaseReference databaseReference = FirebaseDatabase.getInstance("https://chittoo-masternew.asia-southeast1.firebasedatabase.app/").getReference("Learndaily").child(Today);
  }
}
