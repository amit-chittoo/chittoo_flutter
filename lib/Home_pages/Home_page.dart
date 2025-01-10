import 'package:chittoo/Games_Pages/Games_Main_page.dart';
import 'package:chittoo/Home_pages/Home_pageview.dart';
import 'package:chittoo/Learn_pages/Learn_Page.dart';
import 'package:chittoo/Profile_pages/Profile_Main_Page.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final _page_controller = PageController();

  // final _pagelist = [Home_pageview(), Learn_page()];
  late int _selectedIndex = 0;
  List<IconData> ListOfIcons = [
    Icons.home_filled,
    Icons.chrome_reader_mode_sharp,
    Icons.card_giftcard_outlined,
    Icons.person
  ];
  List<String> selected_ListOfIcons = [
    "assets/images/home_selected.jpg",
    "assets/images/learn_select.jpg",
    "assets/images/gift_selet.jpg",
    "assets/images/profile_select.jpg"
  ];
  List<String> unselected_ListOfIcons = [
    "assets/images/home_unselected.jpg",
    "assets/images/learn_unselect.jpg",
    "assets/images/gift_unselet.jpg",
    "assets/images/profile_unselect.jpg"
  ];
  Color _btn_color = const Color(0xFFF57952);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: size.height * .070,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 30,
                  offset: Offset(0, 10))
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Center(
          child: ListView.builder(
            itemCount: 4,
            itemExtent: size.width / 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                _selectedIndex = index;
                setState(() {
                  _page_controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                  );
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    width: 10,
                    height: 5,
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    decoration: BoxDecoration(
                        color: index == _selectedIndex
                            ? Colors.orangeAccent
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: size.width * .090,
                    height: size.height * .04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: index == _selectedIndex
                          ? Color.fromARGB(255, 252, 244, 227)
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Icon(ListOfIcons[index],
                          size: size.width * .050,
                          color: index == _selectedIndex
                              ? Color.fromARGB(255, 245, 121, 82)
                              : Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: PageView(
          onPageChanged: (int page) {
            print(_page_controller.page);
            setState(() {
              // this is for going from first page to learn page from other course.
              //when we go from home page to learn page _page_controller.page gives 0.5
              // so checking is the page int is 1 (means learn page) and  _page_controller.page is 0.5
              if (page == 1 && _page_controller.page == 0.5) {
                _selectedIndex = 1;
              }
            });
          },
          physics: NeverScrollableScrollPhysics(),
          controller: _page_controller,
          // scrollDirection: Axis.horizontal,
          children: [
            Home_pageview(
                page_controller: _page_controller,
                selectedIndex: _selectedIndex),
            Learn_page(),
            Games_Main_page(),
            Profile_Main_Page(),
          ]),
    );
  }

// void _onTabTapped(int index) {
//   setState(() {
//     _selectedIndex = index;
//   });
// }
}
