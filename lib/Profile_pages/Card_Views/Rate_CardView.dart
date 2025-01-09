import 'package:flutter/material.dart';

class Rate_CardView extends StatefulWidget {
  const Rate_CardView({super.key});

  @override
  State<Rate_CardView> createState() => _Rate_CardViewState();
}

class _Rate_CardViewState extends State<Rate_CardView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.star,
          size: 60,
          color: Colors.yellow,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rate Your Experience",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              "Rate us on Google Play Store",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios,color: Colors.white,)
      ],
    );
  }
}
