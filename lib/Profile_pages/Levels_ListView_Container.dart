import 'package:flutter/material.dart';

class Levels_List_View_container extends StatefulWidget {
  final index;

  const Levels_List_View_container({super.key, required this.index});

  @override
  State<Levels_List_View_container> createState() =>
      _Levels_List_View_containerState();
}

class _Levels_List_View_containerState
    extends State<Levels_List_View_container> {
  @override
  Widget build(BuildContext context) {
    List<String> Image_list_address = [
      "Images/conis.png",
      "Images/trophy.png",
      "Images/shield.png",
      "Images/level.png"
    ];
    List<String> _names = ["Coins", "Trophy", "Shield", "Level"];
    return Card(
      elevation: 10,
      shadowColor: Color(0xFFEEC3B3),
      child: Container(
        decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.all(Radius.circular(
            10))),

        width: 70,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xFFF4ECE9),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Image(
                  image: AssetImage(Image_list_address[widget.index]),
                  width: 10,
                  height: 10,
                )),
            Text(_names[widget.index]),
            Text(""),
          ],
        ),
      ),
    );
  }
}
