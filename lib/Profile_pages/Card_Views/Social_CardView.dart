import 'package:flutter/material.dart';

class Social_CardView extends StatefulWidget {
  const Social_CardView({super.key});

  @override
  State<Social_CardView> createState() => _Social_CardViewState();
}

class _Social_CardViewState extends State<Social_CardView> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "Images/facebook.png",
      "Images/insta.png",
      "Images/youtuber.png",
      "Images/linkedin.png",
      "Images/telegram.png",
      "Images/whatsapp.png"
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Social Media Links",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              width: MediaQuery.of(context).size.width*0.83,
              height: 30,
              child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 13),
                    child: Image(
                      image: AssetImage(images[index]),
                      fit: BoxFit.contain,
                      width: 40,
                      height: 50,
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
