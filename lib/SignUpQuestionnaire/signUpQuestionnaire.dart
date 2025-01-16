import 'package:chittoo/SignUpQuestionnaire/10Questionnaire.dart';
import 'package:chittoo/globals.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  String? selectedLanguage; // Variable to track the selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                "Learn English in",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLanguage = "English";
                  });
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: selectedLanguage == "English"
                        ? Color(0xFFF57952) // Highlight if selected
                        : Colors.grey[100],
                  ),
                  child: Center(
                    child: Text(
                      "English",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLanguage = "हिन्दी";
                  });
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: selectedLanguage == "हिन्दी"
                        ? Color(0xFFF57952) // Highlight if selected
                        : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "हिन्दी",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (selectedLanguage == null) {
                        Fluttertoast.showToast(
                          msg: "Please select an option",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      } else {
                        // Log the selected language
                        print("Selected Language: $selectedLanguage");
                        if (isFromGetStarted == true) {
                          selectedLanguageGlobal = selectedLanguage!;
                          print(
                              "Selected Language Global: $selectedLanguageGlobal");
                        }
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WhyInterest()),
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: selectedLanguage == null
                            ? Colors.grey // Disable if no option selected
                            : Color(0xFFF57952),
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WhyInterest extends StatefulWidget {
  @override
  _WhyInterestState createState() => _WhyInterestState();
}

class _WhyInterestState extends State<WhyInterest> {
  final List<String> options = [
    "Education",
    "Interview",
    "Career",
    "Office",
    "Social Life",
    "Travel",
    "Shopping",
    "Medical",
    "Finance"
  ];

  final List<String> imageOption = [
    "assets/images/education_icon_png.png",
    "assets/images/interview_icon.png",
    "assets/images/career_icon.png",
    "assets/images/office_icon.png",
    "assets/images/daily_life_icon.png",
    "assets/images/travel_icon.png",
    "assets/images/shopping_icon.png",
    "assets/images/medical_icon.png",
    "assets/images/finance_icon.png",
  ];

  String? selectedInterest; // Tracks the selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Why do you want to\nlearning English?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "आप इंग्लिश क्यों सीखना चाहते हैं",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFF57952),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedInterest = options[index];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10), // Spacing
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: selectedInterest == options[index]
                            ? Color(0xFFF57952) // Highlight selected option
                            : Colors.grey[100],
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            options[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Image.asset(
                            imageOption[index],
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (selectedInterest == null) {
                      Fluttertoast.showToast(
                        msg: "Please select an option",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                      );
                    } else {
                      // Log the selected interest
                      print("Selected Interest: $selectedInterest");
                      if (isFromGetStarted == true) {
                        selectedWhyInterestGlobal = selectedInterest!;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WhyInterestUi() // Pass the selected interest
                            ),
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedInterest == null
                          ? Colors.grey // Disable if no option selected
                          : Color(0xFFF57952),
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhyInterestUi extends StatefulWidget {
  @override
  _WhyInterestUiState createState() => _WhyInterestUiState();
}

class _WhyInterestUiState extends State<WhyInterestUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFF57952),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/whyinterestUi.png",
                      height: 160, // Set your desired height
                      width: 160, // Set your desired width
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Text(
                  "  I am an expert in\nteaching English for\n        Social Life",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrentLevel())),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF57952),
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

class CurrentLevel extends StatefulWidget {
  @override
  _CurrentLevelState createState() => _CurrentLevelState();
}

class _CurrentLevelState extends State<CurrentLevel> {
  String? selectedLevel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "What is your current level \n             in English?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "आपकी अंग्रेजी का स्तर कौन सा है?",
                  style: TextStyle(fontSize: 16, color: Color(0xFFF57952)),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLevel = "Basic";
                    });
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: selectedLevel == "Basic"
                          ? Color(0xFFF57952) // Highlight if selected
                          : Colors.grey[100],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Basic",
                            style: TextStyle(
                              color: selectedLevel == "Basic"
                                  ? Colors.white // Highlight if selected
                                  : Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Image.asset(
                            "assets/images/basic_icon.png",
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLevel = "Intermediate";
                    });
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: selectedLevel == "Intermediate"
                          ? Color(0xFFF57952) // Highlight if selected
                          : Colors.grey[100],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Intermediate",
                            style: TextStyle(
                              color: selectedLevel == "Intermediate"
                                  ? Colors.white // Highlight if selected
                                  : Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Image.asset(
                            "assets/images/intermediate_icon.png",
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLevel = "Advanced";
                    });
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: selectedLevel == "Advanced"
                          ? Color(0xFFF57952) // Highlight if selected
                          : Colors.grey[100],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Advanced",
                            style: TextStyle(
                              color: selectedLevel == "Advanced"
                                  ? Colors.white // Highlight if selected
                                  : Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Image.asset(
                            "assets/images/advance_icon.png",
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      if (selectedLevel == null) {
                        Fluttertoast.showToast(
                          msg: "Please select an option",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      } else {
                        // Log the selected language
                        print("Selected Level: $selectedLevel");
                        if (isFromGetStarted == true) {
                          selectedCurrentLevelGlobal = selectedLevel!;
                        }
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CurrentLevelUi()),
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF57952),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

class CurrentLevelUi extends StatefulWidget {
  @override
  _CurrentLevelUiState createState() => _CurrentLevelUiState();
}

class _CurrentLevelUiState extends State<CurrentLevelUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFF57952),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/whyinterestUi.png",
                      height: 160, // Set your desired height
                      width: 160, // Set your desired width
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                ),
                Text(
                  " You will reach the next\nlevel with daily practice.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DailyPractice())),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF57952),
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

class DailyPractice extends StatefulWidget {
  @override
  _DailyPracticeState createState() => _DailyPracticeState();
}

class _DailyPracticeState extends State<DailyPractice> {
  String? selectedDailypractice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  " How much time you\nwant to practice daily?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "आप हर दिन कितना समय Chittoo के साथ \n              प्रैक्टिस करना चाहते हैं ?",
                  style: TextStyle(fontSize: 16, color: Color(0xFFF57952)),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDailypractice = "5min/day";
                    });
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: selectedDailypractice == "5min/day"
                          ? Color(0xFFF57952) // Highlight if selected
                          : Colors.grey[100],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "5 Min/day",
                            style: TextStyle(
                              color: selectedDailypractice == "5min/day"
                                  ? Colors.white // Highlight if selected
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Image.asset(
                            "assets/images/min_icon1.png",
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDailypractice = "10min/day";
                    });
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: selectedDailypractice == "10min/day"
                          ? Color(0xFFF57952) // Highlight if selected
                          : Colors.grey[100],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "10 Min/day",
                            style: TextStyle(
                              color: selectedDailypractice == "10min/day"
                                  ? Colors.white // Highlight if selected
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Image.asset(
                            "assets/images/min_icon2.png",
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDailypractice = "15min/day";
                    });
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: selectedDailypractice == "15min/day"
                          ? Color(0xFFF57952) // Highlight if selected
                          : Colors.grey[100],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "15 Min/day",
                            style: TextStyle(
                              color: selectedDailypractice == "15min/day"
                                  ? Colors.white // Highlight if selected
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Image.asset(
                            "assets/images/min_icon3.png",
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      if (selectedDailypractice == null) {
                        Fluttertoast.showToast(
                          msg: "Please select an option",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      } else {
                        // Log the selected language
                        print(
                            "Selected dailyPracticeTime: $selectedDailypractice");
                        if (isFromGetStarted == true) {
                          selectedDailyPracticeGlobal = selectedDailypractice!;
                        }
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DailyPracticeUi(
                                  wordCount: selectedDailypractice)),
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF57952),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

class DailyPracticeUi extends StatefulWidget {
  final String? wordCount;
  DailyPracticeUi({required this.wordCount});
  @override
  _DailyPracticeUiState createState() => _DailyPracticeUiState();
}

class _DailyPracticeUiState extends State<DailyPracticeUi> {
  int word = 0;

  @override
  void initState() {
    super.initState();
    word = getWordCount(widget.wordCount);
  }

  int getWordCount(String? selectedDailypractice) {
    if (selectedDailypractice == "5min/day") {
      return 50;
    } else if (selectedDailypractice == "10min/day") {
      return 75;
    } else if (selectedDailypractice == "15min/day") {
      return 100;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFF57952),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/whyinterestUi.png",
                      height: 160,
                      width: 160,
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                ),
                Text(
                  "That's ${word} new Words\n  in your first week",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TopicInterest())),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF57952),
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

class TopicInterest extends StatefulWidget {
  @override
  _TopicInterestState createState() => _TopicInterestState();
}

class _TopicInterestState extends State<TopicInterest> {
  final List<String> options = [
    "Friendship English",
    "Interview English",
    "Health English",
    "Office English",
    "Professional English",
    "Finance English",
    "Daily English",
    "Travel English",
    "Shopping English"
  ];

  List<String> selectedInterests = []; // Tracks the selected options

  void handleOptionTap(String option) {
    setState(() {
      if (selectedInterests.contains(option)) {
        selectedInterests.remove(option);
      } else if (selectedInterests.length < 3) {
        selectedInterests.add(option);
        if (selectedInterests.length == 1) {
          Fluttertoast.showToast(
            msg: "Select 2 more options",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            textColor: Colors.white,
          );
        } else if (selectedInterests.length == 2) {
          Fluttertoast.showToast(
            msg: "Select 1 more option",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            textColor: Colors.white,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Pick 3 Topics Of Interest",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "आपकी पसंदीदा 3 टॉपिक चुनिए।",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFF57952),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  return GestureDetector(
                    onTap: () => handleOptionTap(option),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10), // Spacing
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: selectedInterests.contains(option)
                            ? Color(0xFFF57952) // Highlight selected options
                            : Colors.grey[100],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            option,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (selectedInterests.length < 3) {
                      Fluttertoast.showToast(
                        msg: "Please select 3 options",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                    } else {
                      // Log the selected interests
                      print("Selected Topic Interests: $selectedInterests");
                      if (isFromGetStarted == true) {
                        selectedInterestsGlobal = selectedInterests;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TopicInterestUi()), // Pass the selected interests
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedInterests.length == 3
                          ? Color(0xFFF57952) // Activate when 3 are selected
                          : Colors.grey, // Disable if less than 3
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopicInterestUi extends StatefulWidget {
  @override
  _TopicInterestUiState createState() => _TopicInterestUiState();
}

class _TopicInterestUiState extends State<TopicInterestUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFF57952),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/whyinterestUi.png",
                      height: 160, // Set your desired height
                      width: 160, // Set your desired width
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Quick Test to \n  check your\nEnglish level",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Questionnaire10())),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF57952),
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
