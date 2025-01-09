
import 'package:chittoo/Home_pages/YouTube_Page.dart';
import 'package:flutter/material.dart';

class Todays_Quiz_ListView extends StatefulWidget {
  final index;

  const Todays_Quiz_ListView({super.key, required this.index});

  @override
  State<Todays_Quiz_ListView> createState() => _Todays_Quiz_ListViewState();
}

class _Todays_Quiz_ListViewState extends State<Todays_Quiz_ListView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("Images/Rectangle 2.2.png"),
                height: 110,
                fit: BoxFit.contain,
              ),
              Text(
                "Text" + widget.index.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 110, top: 95),
            height: 30,
            child: FilledButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF57952)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => YouTube_Page()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Start",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.play_circle,
                      size: 12,
                    )
                  ],
                )),
          ),
          Center(
            widthFactor: 4,
            heightFactor: 2,
            child: Icon(
              Icons.play_circle_outline_outlined,
              color: Colors.white,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
