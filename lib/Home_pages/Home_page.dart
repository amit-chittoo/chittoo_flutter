import 'package:chittoo/Games_Pages/Games_Main_page.dart';
import 'package:chittoo/Home_pages/Home_pageview.dart';
import 'package:chittoo/Learn_pages/Learn_Page.dart';
import 'package:chittoo/Profile_pages/Profile_Main_Page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Home_pageview(
        page_controller: _pageController,
        selectedIndex: _selectedIndex,
      ),
      Learn_page(),
      Games_Main_page(),
      Profile_Main_Page(),
    ];

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: _selectedIndex,
        items: [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.chrome_reader_mode_sharp, size: 30, color: Colors.white),
          Icon(Icons.card_giftcard_outlined, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Color(0xFFF57952),
        buttonBackgroundColor: Color(0xFFF57952) ,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index; // Sync with navigation bar
          });
        },
        // Allow swipe gestures
        physics: const BouncingScrollPhysics(),
        children: _pages,
      ),
    );
  }
}
