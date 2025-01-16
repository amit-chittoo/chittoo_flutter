import 'package:chittoo/Home_pages/Home_page.dart';
import 'package:chittoo/Log_In_Pages/Log_In_Page.dart';
import 'package:chittoo/Screen/Intro_Page/Congraulations/Congraulations.dart';
import 'package:chittoo/Screen/Intro_Page/newIntroPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/splashCubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..checkLoginStatus(),
      child: BlocListener<SplashCubit, bool>(
        listener: (context, isLoggedIn) {
          if (isLoggedIn) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home_page()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NewIntroPage()),
            );
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
color: Color(0xFFF57952),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //  SvgPicture.asset(
                //     "assets/images/splashscreen.svg", // Replace with your SVG file path
             
                //   ),
              Center(
                child: Image.asset("assets/images/chittoo_logo.png",height: 300,width: 
                300),
              ),
                  // Center(
                  //   child: CupertinoActivityIndicator(
                  //     color:const Color(0xFFF57952),
                  //   ),
              
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
