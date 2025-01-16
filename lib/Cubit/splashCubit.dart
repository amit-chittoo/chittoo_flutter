import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async'; // To use Future.delayed

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  Future<void> checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 4)); 
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.containsKey("user.email");
    print("isLoggedIn: $isLoggedIn");
    emit(isLoggedIn);
  }
}
