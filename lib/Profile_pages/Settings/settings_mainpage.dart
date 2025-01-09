
import 'package:chittoo/GoogleSignIn.dart';
import 'package:flutter/material.dart';

class Settings_MainPage extends StatefulWidget {
  const Settings_MainPage({super.key});

  @override
  State<Settings_MainPage> createState() => _Settings_MainPageState();
}

class _Settings_MainPageState extends State<Settings_MainPage> {
  bool _swtich = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(right: 10),
                          decoration: const BoxDecoration(
                              color: Color(0xFFFDECE1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios_new_outlined),
                            color: Color(0xFFF57952), onPressed: () { Navigator.pop(context); },
                          )),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Settings",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFFDECE1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Icon(
                                Icons.notifications,
                                color: Color(0xFFF57952),
                              )),
                          Text("App Notification",
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                          value: _swtich,
                          onChanged: (val) {
                            setState(() {
                              _swtich = val;
                            });
                          },
                          inactiveTrackColor: Colors.grey,
                          inactiveThumbColor: Colors.white,
                          activeColor: Color(0xFFF57952),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFFDECE1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Icon(
                                Icons.notifications,
                                color: Color(0xFFF57952),
                              )),
                          Text("Whatsapp Notification",
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                          value: false,
                          onChanged: (val) {},
                          inactiveTrackColor: Colors.grey,
                          inactiveThumbColor: Colors.white,
                          activeColor: Color(0xFFF57952),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          Icons.notifications,
                          color: Color(0xFFF57952),
                        )),
                    Text("FAQ", style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          Icons.email,
                          color: Color(0xFFF57952),
                        )),
                    Text("Contact Us", style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          Icons.watch_later,
                          color: Color(0xFFF57952),
                        )),
                    Text("Daily Practice time", style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("App info"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          Icons.library_books,
                          color: Color(0xFFF57952),
                        )),
                    Text("Terms & Conditions", style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          Icons.delete,
                          color: Color(0xFFF57952),
                        )),
                    Text("Delete Account", style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDECE1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          Icons.lock,
                          color: Color(0xFFF57952),
                        )),
                    Text("Privacy Policy", style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFFDECE1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Icon(
                                Icons.check_circle_outline_outlined,
                                color: Color(0xFFF57952),
                              )),
                          Text("Update", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                          value: false,
                          onChanged: (val) {},
                          inactiveTrackColor: Colors.grey,
                          inactiveThumbColor: Colors.white,
                          activeColor: Color(0xFFF57952),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // final provider =
                    //     Provider.of<Googlesignin>(context, listen: false);
                    // provider.signout(context);
                  },
                  child: Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(right: 10),
                          decoration: const BoxDecoration(
                              color: Color(0xFFFDECE1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Icon(
                            Icons.exit_to_app,
                            color: Color(0xFFF57952),
                          )),
                      Text("Signout", style: TextStyle(fontSize: 20)),
                    ],
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
