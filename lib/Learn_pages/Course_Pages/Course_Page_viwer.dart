import 'package:flutter/material.dart';

import 'Course_page_inner_View.dart';

class Course_ListPage extends StatefulWidget {
  final index;

  const Course_ListPage({super.key, required this.index});

  @override
  State<Course_ListPage> createState() => _Course_ListPageState();
}

class _Course_ListPageState extends State<Course_ListPage> {
  List<String> _names = [
    "Friendship",
    "Interview",
    "Daily",
    "Office",
    "Professional",
    "Travel",
    "Health",
    "Shopping",
    "Finance"
  ];
  List<String> _course_sub_header_list = [
    "युवाओं के लिए इंग्लिश।",
    "इंटरव्यू रेडी करने वाली इंग्लिश।",
    "रोज़ाना काम आने वाली इंग्लिश।",
    "ऑफिस में काम आने वाली इंग्लिश।",
    "अन्य प्रोफेशन के लिए इंग्लिश।",
    "यात्रा में काम आने वाली इंग्लिश।",
    "मेडिकल इमरजेंसी के लिए इंग्लिश।",
    "शॉपिंग में काम आने वाली इंग्लिश।",
    "फाइनेंस की बातों के लिए इंग्लिश।"
  ];
  List<String> _course_images = [
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2F2ehgf5vanj2?alt=media&token=b1ce91e5-ffb1-4ca7-9d79-0e7fac9074c0",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2Fmg17kgqvax?alt=media&token=0e17377e-abcb-4b21-a4b5-8a7362a180a9",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2Fnowa7n14ae?alt=media&token=ceeeb70e-c61f-41d6-9bd3-b1bc629c12ec",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2Fdb77ps5nmcd?alt=media&token=37c55c5c-0fdf-441c-abdb-83e3cc87caaa",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2F77vao0gum7w?alt=media&token=78fae49d-e032-477c-b338-8a685d5f5943",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2Fsvvj17skd2r?alt=media&token=813aae53-8c16-4e70-ab16-db9ff8fa5847",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2Fy8k71eyzyu?alt=media&token=e463a937-1ac5-45e5-aa03-da250d371608",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2Fg9b3317di7?alt=media&token=b1676889-17f6-4c1e-aaf0-c15e7131f789",
    "https://firebasestorage.googleapis.com/v0/b/chittoo-f17e7.appspot.com/o/Course_Upload%2F5prs25bxa9n?alt=media&token=0290e8d8-627c-4194-909e-d858bdeceb71"
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (BuildContext context) {
          return Course_Topic_View();
        }));
      },
      child: Card(
        
        surfaceTintColor: Colors.white,
        elevation: 5,
        margin: EdgeInsets.only(bottom: 40,left: 20,right: 20),
        shape: RoundedRectangleBorder(
          // Add a border radius here if you want rounded corners
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),
          height: 260,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 180,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),
                child: Image.network(
                  _course_images[widget.index],
                  fit: BoxFit.fill,

                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      heightFactor:170 ,
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
              // Image(
              //   image: AssetImage("Images/Mask Group.png"),
              //   fit: BoxFit.fill,
              //   width: MediaQuery.of(context).size.width - 50,
              //   height: 160,
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _names[widget.index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(_course_sub_header_list[widget.index]),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_circle_right_outlined),
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
