import 'package:flutter/material.dart';
import 'profile_screen.dart';

class OtpScreen extends StatefulWidget {
  final String otp;
  final String mobileNumber;

  OtpScreen({required this.otp, required this.mobileNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpControllers = List.generate(6, (index) => TextEditingController());
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Code is sent to ${widget.mobileNumber}',
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 40,
                    child: TextField(
                      controller: _otpControllers[index],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.length == 1 && index < 5) {
                          FocusScope.of(context)
                              .nextFocus(); // Move to next box
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context)
                              .previousFocus(); // Move to previous box
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String enteredOtp = _otpControllers
                      .map((controller) => controller.text)
                      .join('');
                  if (enteredOtp == widget.otp) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  } else {
                    setState(() {
                      errorMessage = 'Incorrect OTP. Please try again.';
                    });
                  }
                },
                child: Text('VERIFY'),
              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child:
                      Text(errorMessage!, style: TextStyle(color: Colors.red)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
