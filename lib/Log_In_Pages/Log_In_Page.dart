import 'dart:developer';
import 'dart:math';
import 'package:chittoo/Games_Pages/Games_Main_page.dart';
import 'package:chittoo/Profile_pages/Profile_Main_Page.dart';
import 'package:chittoo/Screen/Intro_Page/Congraulations/Congraulations.dart';
import 'package:chittoo/SignUpQuestionnaire/signUpQuestionnaire.dart';
import 'package:chittoo/globals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Home_pages/Home_page.dart';

class Log_In extends StatefulWidget {
  const Log_In({super.key});

  @override
  State<Log_In> createState() => _Log_InState();
}

class _Log_InState extends State<Log_In> {
  bool _isChecked = true;

  // final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _phonenumbercontorller = TextEditingController();
  String _error_text = "";
  @override
  void initState() {
    setState(() {
      isFromGetStarted=false;
    });
    super.initState();
    
  
  }
  @override
  Widget build(BuildContext context) {
    Size _page_size = MediaQuery.of(context).size;
    Color _btn_color = const Color(0xFFF57952);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFFAFAFC),
          width: _page_size.width,
          // margin: EdgeInsets.only(top: 100),
          padding: const EdgeInsets.all(20),
          height: _page_size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 28),
                    child: const Image(
                      image: AssetImage("assets/images/chittoo_logo.png"),
                      width: 85,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: "Euclid Circular",
                      fontWeight: FontWeight.w600),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   "Full Name",
                //   style: TextStyle(color: Colors.grey),
                // ),
                // Container(
                //   height: 65,
                //   margin: EdgeInsets.only(top: 10),
                //   padding: EdgeInsets.only(left: 10),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(10)),
                //     border: Border.all(color: Colors.deepOrange),
                //   ),
                //   child: Center(
                //     child: TextFormField(
                //       controller: _namecontroller,
                //       style: const TextStyle(fontSize: 13),
                //       maxLines: 1,
                //       decoration: const InputDecoration(
                //           labelStyle: TextStyle(fontSize: 13),
                //           border: InputBorder.none,
                //           hintText: 'Enter your Name'),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 19,
                ),
                const Text(
                  "Mobile Number",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Euclid Circular",
                      fontWeight: FontWeight.w300),
                ),
                Container(
                  width: _page_size.width * 0.9,
                  height: 65,
                  margin: const EdgeInsets.only(top: 10),

                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.deepOrange),
                  ),
                  child: Row(
                    children: [
                      // CountryCodePicker(
                      //   onChanged: (CountryCode? code) {
                      //     setState(() {});
                      //   },
                      //   initialSelection: 'IN',
                      //   favorite: ['+91', 'IN'],
                      //   showCountryOnly: false,
                      //   showFlagDialog: true,
                      // ),
                      // Expanded(
                      //   child: TextFormField(
                      //     controller: _phonenumbercontorller,
                      //     keyboardType: TextInputType.phone,
                      //     style: const TextStyle(
                      //         fontSize: 13,
                      //         fontFamily: "Euclid Circular",
                      //         fontWeight: FontWeight.w300),
                      //     maxLines: 1,
                      //     decoration: InputDecoration(
                      //         errorText:
                      //             _error_text.isNotEmpty ? _error_text : null,
                      //         fillColor: Colors.white,
                      //         labelStyle: const TextStyle(
                      //             fontSize: 13,
                      //             fontFamily: "Euclid Circular",
                      //             fontWeight: FontWeight.w300),
                      //         border: InputBorder.none,
                      //         hintText: 'Phone'),
                      //   ),
                      // ),
                    ],
                  ),

                  // child: TextFormField(
                  //   keyboardType: TextInputType.phone,
                  //   style: const TextStyle(fontSize: 13),
                  //   maxLines: 1,
                  //   decoration: const InputDecoration(
                  //       labelStyle: TextStyle(fontSize: 13),
                  //       border: InputBorder.none,
                  //       hintText: 'Phone'),
                  // ),
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "OR",
                      style: TextStyle(
                          fontFamily: "Euclid Circular",
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Fluttertoast.showToast(
                      //     msg: "Please Wait",
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.CENTER,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0);
                      // final provider =
                      //     Provider.of<Googlesignin>(context, listen: false);
                      // provider.

                      signInWithGoogle(context);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_page()));
                    },
                    child: Container(
                      width: 140,
                      height: 70,
                      margin: const EdgeInsets.only(top: 5),
                      child: Card(
                          color: Colors.transparent,
                          shadowColor: Colors.transparent,
                          elevation: 20,
                          surfaceTintColor: Colors.transparent,
                          child: Image.asset("assets/images/google_icon.png")),
                    ),
                  ),
                ),

                Row(
                  children: [
                    Checkbox(
                        side: const BorderSide(
                          width: 2,
                          color: Color(
                              0xFFF57952), // Specify the color of the border
                        ),
                        activeColor: const Color(0xFFF57952),
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        }),
                    const Flexible(
                        child: Text(
                      "I accept all the Terms and Privacy Policy",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Euclid Circular",
                          fontWeight: FontWeight.w300),
                    )),
                  ],
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    width: 200,
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: FilledButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _btn_color,
                          // Background color
                        ),
                        onPressed: () async {
                          // if (_phonenumbercontorller.text.isNotEmpty &&
                          //     _isChecked) {
                          //   // Google Login
                          //   final provider = Provider.of<Googlesignin>(context,
                          //       listen: false);
                          //   provider.signInWithGoogle(context);
                          // } else {
                          //   if (_phonenumbercontorller.text.isEmpty) {
                          //     setState(() {
                          //       _error_text = "Please enter mobile number";
                          //     });

                          //     Fluttertoast.showToast(
                          //       msg: "Please enter your phone number",
                          //       toastLength: Toast.LENGTH_SHORT,
                          //       gravity: ToastGravity.TOP,
                          //       timeInSecForIosWeb: 10,
                          //       backgroundColor: Colors.black,
                          //       textColor: Colors.white,
                          //       fontSize: 16.0,
                          //     );
                          //   } else if (!_isChecked) {
                          //     Fluttertoast.showToast(
                          //       msg: "Please agree to terms and conditions",
                          //       toastLength: Toast.LENGTH_SHORT,
                          //       gravity: ToastGravity.TOP,
                          //       timeInSecForIosWeb: 10,
                          //       backgroundColor: Colors.black,
                          //       textColor: Colors.white,
                          //       fontSize: 16.0,
                          //     );
                          //   }
                          //    }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create Profile",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Euclid Circular",
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.navigate_next,
                              size: 35,
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    // Step 1: Google Sign-In
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google sign-in canceled.")),
      );
      return;
    }

    // Step 2: Authenticate with Firebase
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google Sign-In Failed.")),
      );
      return;
    }
    final DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('users').child(user.uid);

    final DatabaseEvent event = await userRef.once();
    if (event.snapshot.exists) {
      await userRef.update({
        'lastLogin': DateTime.now().toString(),
      });
      final Map<dynamic, dynamic> userData =
          event.snapshot.value as Map<dynamic, dynamic>;

      final String lastLoginString = userData['lastLogin'] ?? '';
      final String userName = userData['name'] ?? '';

   final String email = userData['email'] ?? '';
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', userName);
      await prefs.setString('userId', user.uid);
      await prefs.setString('user.email', email);
      DateTime? lastLoginDate;
      bool isSameCalendarDay(DateTime lastLogin, DateTime now) {
        return lastLogin.year == now.year &&
            lastLogin.month == now.month &&
            lastLogin.day == now.day;
      }

      if (lastLoginString.isNotEmpty) {
        lastLoginDate = DateTime.tryParse(lastLoginString);

        if (lastLoginDate == null ||
            !isSameCalendarDay(
                lastLoginDate, DateTime.now())) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CongraulationsPage(isFromSignUp: true)),
          );
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home_page()));
        }
      }
    } else {
      await userRef.set({
        'name': "Username",
        'email': user.email ?? 'No Email',
        'createdAt': DateTime.now().toString(),
        'lastLogin': DateTime.now().toString(),
        'coins': 100,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelectLanguage()),
      );
    }
  } catch (e) {
    print("Google Sign-In Error: $e");
   await guestlogin(context);
  }

}

  
Map<String, String> guestIdPassword() {
  final random = Random();
  final randomNumber = random.nextInt(100000); 
  final email = "guestuser$randomNumber@chittoo.com";
  final password = List.generate(10, (index) => String.fromCharCode(random.nextInt(26) + 97)).join();
  return {"email": email, "password": password};
}

Future<void> guestlogin(BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref().child('users');
  Map<String, String> credentials = guestIdPassword();
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
        'password':password,
      });

      print("User registered and data saved successfully!"+user.email.toString());
      print("User ID: ${user.uid}");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectLanguage()));
    } else {
      print("User creation failed: No user returned.");
    }
  } catch (e) {
    // Handle email already in use error by retrying with a new email
    if (e is FirebaseAuthException && e.code == "email-already-in-use") {
      print("Email already in use, generating a new email...");
      await guestlogin(context);
    } else {
      print("Error: $e");
    }
  }
}