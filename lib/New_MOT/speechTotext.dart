import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeakToText extends StatefulWidget {
  SpeakToText({Key? key}) : super(key: key);

  @override
  _SpeakToTextState createState() => _SpeakToTextState();
}

class _SpeakToTextState extends State<SpeakToText> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = ''; // Real-time text as you speak
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

   void _startListening(BuildContext context) async {
    _lastWords = ''; 
    setState(() {
      _isListening = true;
    });

    await _speechToText.listen(
      onResult: _onSpeechResult,
      listenMode: ListenMode.dictation,
    );

  
    _showSpeechDialog(context);
  }

  /// Stop listening after speech ends
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });
  }

  /// Callback when speech result is available
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords; // Update recognized words
    });
  }

  /// Show the speech dialog and dynamically update the recognized words


/// Show the speech dialog and dynamically update the recognized words
void _showSpeechDialog(BuildContext context) {
  // Timer to detect silence
  Timer? _silenceTimer;

  void _startSilenceTimer() {
    _silenceTimer?.cancel();
    _silenceTimer = Timer(Duration(milliseconds: 1500), () {
      if (_speechToText.isListening) {
        Navigator.of(context).pop(); 
      }
    });
  }

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: EdgeInsets.all(20),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            _speechToText.listen(
              onResult: (result) {
                setState(() {
                  _lastWords = result.recognizedWords; 
                });
                setDialogState(() {
                 
                });
                _startSilenceTimer(); 
              },
              listenMode: ListenMode.dictation,
            );

            _startSilenceTimer(); 

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.mic,
                  color: Colors.red,
                  size: 50,
                ),
                SizedBox(height: 16),
                Text(
                  _speechToText.isListening
                      ? 'Listening...'
                      : 'Processing...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                
                SizedBox(height: 8),
                Text(
                  _lastWords,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            );
          },
        ),
      );
    },
  ).then((_) {
    _silenceTimer?.cancel();
    // Stop listening when the dialog is dismissed
    _silenceTimer?.cancel();
    _stopListening();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech To Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Tap the mic and speak...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: TextEditingController(text: _lastWords), 
            
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _speechEnabled
                  ? () => _startListening(context)
                  : null,
              icon: Icon(Icons.mic),
              label: Text('Start Listening'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
