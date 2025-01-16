import 'package:chittoo/Home_pages/Home_page.dart';
import 'package:chittoo/Log_In_Pages/Log_In_Page.dart';
import 'package:chittoo/Screen/Intro_Page/Congraulations/Congraulations.dart';
import 'package:chittoo/SignUpQuestionnaire/signUpProgessSave.dart';
import 'package:chittoo/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Questionnaire10 extends StatefulWidget {
  const Questionnaire10({Key? key}) : super(key: key);

  @override
  State<Questionnaire10> createState() => _Questionnaire10State();
}

class _Questionnaire10State extends State<Questionnaire10> {
  final PageController _pageController = PageController();
  final FlutterTts _flutterTts = FlutterTts();
  int _currentIndex = 0;
  String? _correctQuestionText;

  final List<Map<String, dynamic>> _questions = [
  {
    "questionText": "The earth __ flat.",
    "options": ["is", "That"],
    "correctOption": "is",
    "correctQuestionText": "The earth is flat."
  },
  {
    "questionText": "The sun ____ in the east.",
    "options": ["rises", "goes"],
    "correctOption": "rises",
    "correctQuestionText": "The sun rises in the east."
  },
  {
    "questionText": "Water ____ at 100 degrees Celsius.",
    "options": ["boils", "freezes"],
    "correctOption": "boils",
    "correctQuestionText": "Water boils at 100 degrees Celsius."
  },
  {
    "questionText": "Birds ____ in the sky.",
    "options": ["swim", "fly"],
    "correctOption": "fly",
    "correctQuestionText": "Birds fly in the sky."
  },
  {
    "questionText": "Fish ____ in water.",
    "options": ["swim", "fly"],
    "correctOption": "swim",
    "correctQuestionText": "Fish swim in water."
  },
  {
    "questionText": "The moon ____ at night.",
    "options": ["shines", "barks"],
    "correctOption": "shines",
    "correctQuestionText": "The moon shines at night."
  },
  {
    "questionText": "Cats ____ milk.",
    "options": ["drink", "eat"],
    "correctOption": "drink",
    "correctQuestionText": "Cats drink milk."
  },
  {
    "questionText": "Dogs ____ loudly.",
    "options": ["bark", "whisper"],
    "correctOption": "bark",
    "correctQuestionText": "Dogs bark loudly."
  },
  {
    "questionText": "The stars ____ at night.",
    "options": ["twinkle", "sleep"],
    "correctOption": "twinkle",
    "correctQuestionText": "The stars twinkle at night."
  },
  {
    "questionText": "Leaves ____ in the wind.",
    "options": ["rustle", "sing"],
    "correctOption": "rustle",
    "correctQuestionText": "Leaves rustle in the wind."
  },
    
  ];

  // List to store user answers
  final List<Map<String, String>> _userAnswers = [];
  String? _selectedOption;

  // Method to make the device speak
  Future<void> _speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.speak(text);
  }

  // Handle option selection
  void _selectOption(String selectedOption) {
    setState(() {
      _selectedOption = selectedOption;
      if (selectedOption == _questions[_currentIndex]["correctOption"]) {
        _correctQuestionText = _questions[_currentIndex]["correctQuestionText"];
      } else {
        _correctQuestionText =
            "${_questions[_currentIndex]["correctQuestionText"]}";
      }

      // Make the device speak the feedback text
      _speak(_correctQuestionText!);
    });
  }

  // Handle moving to the next question
  void _nextQuestion() {
    // Save the current question and selected answer
    _userAnswers.add({
    
      "correctOption": _questions[_currentIndex]["correctOption"],
    });

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
        _correctQuestionText = null;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Quiz completed
      print("Quiz Completed! User Answers:"+_userAnswers.toString());
      for (var answer in _userAnswers) {
        print("Quiz Completed! User Answers:"+answer.toString());
      }

      // Show completion message
     Navigator.push(context, MaterialPageRoute(builder: (context)=> Questionnaire10Ui()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${_currentIndex + 1} of ${_questions.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (_currentIndex + 1) / _questions.length,
                      backgroundColor: Colors.grey[300],
                      color: const Color(0xFFF57952),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  final question = _questions[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Choose the correct word", style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold),),
SizedBox(height: 20,),
                        Text(
                          question["questionText"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        ...question["options"].map<Widget>((option) {
                          final isCorrect = option == question["correctOption"];
                          final isSelected = option == _selectedOption;
                          return GestureDetector(
                            onTap: () {
                              if (_selectedOption == null) {
                                _selectOption(option);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.all(16.0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? (isCorrect ? Colors.green : Colors.red)
                                    : Colors.white,
                              
                                boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                option,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (_correctQuestionText != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _correctQuestionText!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFFF57952),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: GestureDetector(
                onTap: () {
                  if (_selectedOption != null) {
                    _nextQuestion();
                  }
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: _selectedOption != null
                        ? const Color(0xFFF57952)
                        : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      _currentIndex < _questions.length - 1
                          ? "Continue"
                          : "Submit",
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
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _flutterTts.stop();
    super.dispose();
  }
}
class Questionnaire10Ui extends StatefulWidget {
  @override
  _Questionnaire10UiState createState() => _Questionnaire10UiState();
}

class _Questionnaire10UiState extends State<Questionnaire10Ui> {
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
                  "     Well done !\nYour level check\n   is complete ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      if (isFromGetStarted == true) {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpProgressSave()
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CongraulationsPage(isFromSignUp: false),
                          ),
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

