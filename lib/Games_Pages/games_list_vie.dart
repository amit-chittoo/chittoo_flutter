
import 'package:flutter/material.dart';

import 'Stories_Pages/Stories_Page.dart';
import 'Stories_Pages/story_model.dart';

class Games_listView extends StatefulWidget {
  final index;
  final List<stories_model> storiesModel;

   Games_listView({super.key, required this.index, required this.storiesModel});

  @override
  State<Games_listView> createState() => _Games_listViewState();
}

class _Games_listViewState extends State<Games_listView> {
  List<String> _btn_name = ["Today", "Winners", "New", "Mistakes", "Fun"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (BuildContext context) {
          return Stories_Page(storiesModel: widget.storiesModel,section: _btn_name[widget.index].toString());
        }));
      },
      child: Container(
          margin: EdgeInsets.only(left: 10),
          width: 50,
          height: 50,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.orangeAccent),
                      color: Colors.transparent),
                  child: Image(
                    image: AssetImage("assets/images/gift_selet.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  _btn_name[widget.index],
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ])),
    );
  }
}
