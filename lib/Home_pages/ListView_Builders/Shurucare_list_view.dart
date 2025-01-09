
import 'package:chittoo/Home_pages/ListView_Builders/Shurucare_Home_Page/Shurucare_home_Page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Shuru_care_ListView_card extends StatefulWidget {
  final int index;
  final List<String> btn_names;
  final List<String> btn_desp;
  final viewpager;

  const Shuru_care_ListView_card({super.key,
    required this.index,
    required this.btn_names,
    required this.btn_desp,
    required this.viewpager});

  @override
  State<Shuru_care_ListView_card> createState() =>
      _Shuru_care_ListView_cardState();
}

class _Shuru_care_ListView_cardState extends State<Shuru_care_ListView_card> {
  late DatabaseReference suggestedDB;

  @override
  Widget build(BuildContext context) {
    // suggestedDB = FirebaseDatabase.instance
    //     .refFromURL(
    //     "https://chittoo-suggested.asia-southeast1.firebasedatabase.app/")
    //     .child("usersuggestevalues");
    return FittedBox(fit: BoxFit.contain,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: 250,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2F52n4kuwmkln?alt=media&token=ff6247ef-6b84-424f-bff5-4cbe3599fc4e',
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(color: Color(0xFFF57952),
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Text('Error loading image');
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 20,
                        child: IntrinsicWidth(
                          child: FilledButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(3.0),
                                backgroundColor: const Color(0xFFF57952)),
                            onPressed: () {},
                            child: Text(
                              widget.btn_names[widget.index],
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        widget.btn_desp[widget.index],

                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 20,
                        child: FilledButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF57952)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (
                                  BuildContext context) {
                                return Shuru_Home_page();
                              }));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Start",
                                  style: TextStyle(fontSize: 9),
                                ),
                                Icon(
                                  Icons.play_circle,
                                  size: 10,
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
