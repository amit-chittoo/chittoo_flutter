import 'dart:developer';
import 'package:chittoo/Games_Pages/Games_Main_page.dart';
import 'package:chittoo/Profile_pages/Profile_Main_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
                              "Next",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Euclid Circular",
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.navigate_next,
                              size: 40,
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

Future<void> signInWithGoogle(context) async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google sign-in canceled.")),
      );
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Google Sign-In Successful!")),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home_page()),
    );
  } catch (e) {
    log("Google Sign-In Error: $e");
  }
}
