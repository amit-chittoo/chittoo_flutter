
import 'package:flutter/material.dart';

class Slpash_Screen_1 extends StatefulWidget {
  const Slpash_Screen_1({super.key});

  @override
  State<Slpash_Screen_1> createState() => _Slpash_Screen_1State();
}

class _Slpash_Screen_1State extends State<Slpash_Screen_1> {
  final PageController _pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index,) {
                // return Splash_Screens(index: index,pageController: _pageController);
              },),
          ),
        ),
      ),
    );
  }
}
