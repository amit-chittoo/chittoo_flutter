
import 'package:chittoo/Learn_pages/Course_Pages/Topic_ListView.dart';
import 'package:chittoo/ads_container.dart';
import 'package:flutter/material.dart';

class Course_Topic_View extends StatefulWidget {
  const Course_Topic_View({super.key});

  @override
  State<Course_Topic_View> createState() => _Course_Topic_ViewState();
}

class _Course_Topic_ViewState extends State<Course_Topic_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFFF4F4F4),
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 252, 244, 227),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new),
                        color: const Color(0xFFF57952),
                      ),
                    ),
                   SizedBox(width: MediaQuery.of(context).size.width*0.3,),
                    const Text(
                      "Topics",
                      style:
                          TextStyle( fontSize: 20),
                    ),

                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 5),
                  width: MediaQuery.of(context).size.width * 9,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(fontSize: 13),
                          maxLines: 1,
                          decoration: const InputDecoration(
                              labelStyle: TextStyle(fontSize: 13),
                              border: InputBorder.none,
                              hintText: 'Search from 100+ Topics'),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mic_none_outlined)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                    ],
                  ),
                ),
                Ads_container(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20,bottom: 30),
                    width: MediaQuery.of(context).size.width,
                  
                    
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Topic_ListView();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
