import 'package:flutter/material.dart';
import 'mobile_number_screen.dart';
import '../painters/wave_painter.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Selection'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please select your Language',
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text('You can change the language anytime',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedLanguage,
                hint: Text('Select Language'),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
                items: <String>['English', 'Hindi']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: selectedLanguage == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MobileNumberScreen(),
                          ),
                        );
                      },
                child: Text('NEXT'),
              ),
              Expanded(
                child: Container(
                  child: CustomPaint(
                    painter: WavePainter(),
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
