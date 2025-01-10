import 'package:flutter/material.dart';

class Contest_PageView extends StatefulWidget {
  final index;

  const Contest_PageView({super.key, required this.index});

  @override
  State<Contest_PageView> createState() => _Contest_PageViewState();
}

class _Contest_PageViewState extends State<Contest_PageView> {
  List<String> _names = ["WIN DAILY CASH", "WIN T-SHIRT", "DID YOU KNOW?"];
  List<String> _image_link = [
    "assets/images/sponsored1.png",
    "assets/images/sponsoredtshirt.png",
    "assets/images/bannernew.png"
  ];
  List<String> _desp = [
    "Participate in daily English Contest and 3 winners "
        "to win Rs 100/ - everday.",
    "First 100 users to compelete the profile to win Chittoo merchandise",
    "You can win English Speaking Certificates by practicing English with CHITTOO"
  ];
  List<String> _btn = ["Participate", "Edit Profile", "Know More"];
  List<Color> _color_list = [
    Color(0xFFE3FDED),
    Color(0xFFE6E0F8),
    Color(0xFFFBEFCD)
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black,
      color: _color_list[widget.index],
      surfaceTintColor: _color_list[widget.index],
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: _color_list[widget.index],
        ),
        // color: Colors.white,

        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  _names[widget.index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: Text(
                    _desp[widget.index],
                    softWrap: true,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  "*Terms and Conditions Apply",
                  style: TextStyle(fontSize: 10),
                ),
                FilledButton(
                  onPressed: () {
                    switch(widget.index)
                    {
                      case 0: print("0");
                      break;
                      case 1: print("1");
                      break;
                      case 2: print("2");
                      break;
                     }
                  },
                  child: Text(_btn[widget.index]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF57952)),
                )
              ],
            ),
            Expanded(
              child: Image(
                image: AssetImage(_image_link[widget.index]),
                fit: BoxFit.fill,
                width: 120,
                height: 120,
              ),
            )
          ],
        ),
      ),
    );
  }
}
