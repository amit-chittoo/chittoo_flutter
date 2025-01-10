
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class Daily_view_page extends StatefulWidget {
  const Daily_view_page({super.key});

  @override
  State<Daily_view_page> createState() => _Daily_view_pageState();
}

class _Daily_view_pageState extends State<Daily_view_page> {
  List<String> _hindi_hints = [
    "जैसे आप कितने बजे उठे",
    "जैसे किसी व्यक्ति के बारे में बताएं ",
    "जैसे अगर अपने आज कुछ नया सीखा",
    "जैसे अपनी पसंद या ना पसंद बताएं",
    "जैसे कल के दिन का प्लान "
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage("assets/images/pencil.png"),
                      width: 50,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                    Text("Daily diary writing")
                  ],
                ),
                Text("अंग्रेजी में रोज़ 5 sentences लिखें"),
              ],
            ),
            Image(
              image: AssetImage("assets/images/youtubelogo.png"),
              width: 30,
              height: 40,
              fit: BoxFit.contain,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * .850,
          height: 200,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * .850,
                height: 25,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(),
                child: Stack(children: [
                  Align(alignment: Alignment.bottomCenter, child: DottedLine()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        (index + 1).toString() + ". ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * .700,
                          height: 12,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: _hindi_hints[index],hintStyle: TextStyle(fontSize: 10)),
                            maxLines: 1,
                          )),
                    ],
                  ),
                ]),
              );
            },
          ),
        ),
        FilledButton(onPressed: () {}, child: Text("Submit")),
        Text(
          "Read your dairy",
          style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFFF57952),
              color: Color(0xFFF57952)),
        )
      ],
    );
  }
}
