import 'package:flutter/material.dart';

class Vocabulary_CardView extends StatefulWidget {
  const Vocabulary_CardView({super.key});

  @override
  State<Vocabulary_CardView> createState() => _Vocabulary_CardViewState();
}

class _Vocabulary_CardViewState extends State<Vocabulary_CardView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vocabulary List",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text("Click for detailed report"),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark,
                color: Colors.orange,
              )),
        )
      ],
    );
  }
}
