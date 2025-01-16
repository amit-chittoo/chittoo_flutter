
import 'dart:math';

import 'package:chittoo/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Map<String, String> generateRandomEmailAndPassword() {
  final random = Random();
  final randomNumber = random.nextInt(100000); 
  final email = "guestuser$randomNumber@chittoo.com";
  final password = List.generate(10, (index) => String.fromCharCode(random.nextInt(26) + 97)).join();
  return {"email": email, "password": password};
}

Future<void> registerWithRandomCredentials() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref().child('users');
  Map<String, String> credentials = generateRandomEmailAndPassword();
  String email = credentials["email"]!;
  String password = credentials["password"]!;

  try {
    // Register the user
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User? user = userCredential.user;
    if (user != null) {
      // Save user data in Realtime Database
      await databaseRef.child(user.uid).set({
        'name': "Username", // Default name for guest users
        'email': user.email ?? 'No Email',
        'createdAt': DateTime.now().toString(),
        'lastLogin': DateTime.now().toString(),
        'coins': 100, // Default coins for new users
      });

     getUserEmailId =user.email!;

      print("User registered and data saved successfully!"+getUserEmailId);
      print("User ID: ${user.uid}");
    } else {
      print("User creation failed: No user returned.");
    }
  } catch (e) {
    // Handle email already in use error by retrying with a new email
    if (e is FirebaseAuthException && e.code == "email-already-in-use") {
      print("Email already in use, generating a new email...");
      await registerWithRandomCredentials();
    } else {
      print("Error: $e");
    }
  }
}
