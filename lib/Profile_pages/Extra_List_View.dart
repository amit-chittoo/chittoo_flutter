
import 'package:chittoo/Profile_pages/leader_board.dart';
import 'package:flutter/material.dart';

class Extra_List_View extends StatefulWidget {
  final index;

  const Extra_List_View({super.key, required this.index});

  @override
  State<Extra_List_View> createState() => _Extra_List_ViewState();
}

class _Extra_List_ViewState extends State<Extra_List_View> {
  @override
  Widget build(BuildContext context) {
    List<String> _image_list = [
      "assets/images/call.png",
      "assets/images/certificates.png",
      "assets/images/leaderborad.png"
    ];
    List<String> _names = ["1 on 1 Call", "Certificates", "Leaderboard"];
    return GestureDetector(
      onTap: () {
        if (widget.index == 2) {
          Navigator.push(
              context, MaterialPageRoute(builder: (BuildContext context) {
            return Leader_board();
          }));
        }
      },
      child: Card(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width / 3.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(_image_list[widget.index]),
                fit: BoxFit.fill,
                width: 30,
                height: 30,
              ),
              Text(_names[widget.index]),
            ],
          ),
        ),
      ),
    );
  }
}
