
import 'package:chittoo/Home_pages/ListView_Builders/Shurucare_Home_Page/Card_container.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Shuru_Home_page extends StatefulWidget {
  const Shuru_Home_page({super.key});

  @override
  State<Shuru_Home_page> createState() => _Shuru_Home_pageState();
}

class _Shuru_Home_pageState extends State<Shuru_Home_page> {
  @override
  Widget build(BuildContext context) {
    Size _page_size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: _page_size.width * 0.040,
                            right: 10,
                            top: _page_size.height * 0.020),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Color(0xFFF57952),
                            ))),
                    Container(
                        margin: EdgeInsets.only(
                            right: 10, top: _page_size.height * 0.020),
                        child: Text(
                          "Doctor Visit",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Image(
                    image: AssetImage("assets/images/intro2.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.09,
                      top: 10,
                      bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Talking to a doctor"),
                          Text("Text in hindi"),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return TimelineTile(
                            beforeLineStyle: LineStyle(
                                thickness: 2, color: Color(0xFFF57952)),
                            indicatorStyle: IndicatorStyle(
                              color: Color(0xFFFDECE1),
                              iconStyle: IconStyle(
                                  iconData: Icons.circle,
                                  fontSize: 15,
                                  color: Color(0xFFF57952)),
                              width: 25,
                            ),
                            isFirst: index == 0 ? true : false,
                            isLast: index == 4 ? true : false,
                            afterLineStyle: LineStyle(
                              thickness: 2,
                              color: Color(0xFFF57952),
                            ),
                            endChild: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Card_Container(
                                index: index,
                              ),
                            ));

                        //   Card_Container(
                        //   index: index,
                        // );
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
