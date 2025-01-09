
import 'package:flutter/material.dart';

import '../../Learn_pages/Course_Pages/Course_page_inner_View.dart';

class Course_Page_view extends StatefulWidget {
  final index;
  final viewpager;
  int selectedIndex;


  Course_Page_view({super.key, this.index, this.viewpager,required this.selectedIndex});

  @override
  State<Course_Page_view> createState() => _Course_Page_viewState();
}

class _Course_Page_viewState extends State<Course_Page_view> {
  List<String> _names = ["FriendShip", "InterView", " Daily", "More Courses"];
  List<String> _desp = [
    "युवा के लिए अंग्रेजी",
    "इंटरव्यू रेडी करने वाली",
    "डेली काम आने वाली",
    ""
  ];
  List<String> _imageurl = [
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2F52n4kuwmkln?alt=media&token=ff6247ef-6b84-424f-bff5-4cbe3599fc4e",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2Fs289rxgs5fp?alt=media&token=e03530ec-2777-4e67-ae8a-689dc388f592",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2Fbwwer4ov8zh?alt=media&token=72c5cde9-6a42-4a1f-a22b-68892831d850",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2Fgbj3xcf89ff?alt=media&token=f61a126f-242a-4b4f-befd-3526541c60fd"
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (widget.index) {
          case 0:
          case 1:
          case 2:
            Navigator.push(
                context, MaterialPageRoute(builder: (BuildContext context) {
              return Course_Topic_View();
            }));
          case 3:
            setState(() {
              widget.selectedIndex=1;
              widget.viewpager.animateToPage(
                1,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            });

            break;
        }
      },
      child: Card(
        elevation: 0,
        child: Container(
          width: 163,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 220,
                height: 140,
                child: Image.network(
                  _imageurl[widget.index],
                  width: 220,
                  fit: BoxFit.fill,
                  height: 140,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFF57952),
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Center(child: Text('Error loading image'));
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _names[widget.index],
                        textAlign: TextAlign.start,
                      ),
                      Text(_desp[widget.index]),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.orange,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

