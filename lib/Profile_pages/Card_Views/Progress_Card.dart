import 'package:flutter/material.dart';

class Progress_CardView extends StatefulWidget {
  const Progress_CardView({super.key});

  @override
  State<Progress_CardView> createState() => _Progress_CardViewState();
}

class _Progress_CardViewState extends State<Progress_CardView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Progress Report",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text("Click for detailed report")
          ],
        ),
        Stack(children: [
          Container(
            width: 50,
            height: 50,
            child: const CircularProgressIndicator(
              value: 0.01,
              color: Colors.red,
              backgroundColor: Colors.grey,
            ),
          ),
          const Positioned(
              top: 16,
              left: 15,
              child: Text(
                "0%",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ]),
      ],
    );
  }
}
