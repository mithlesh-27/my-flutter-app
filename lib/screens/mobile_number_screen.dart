import 'dart:math';
import 'package:flutter/material.dart';
import 'otp_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileNumberScreenState createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final _mobileNumberController = TextEditingController();
  String? errorMessage;
  String? selectedCountryCode = '+1';
  final List<String> countryCodes = ['+1', '+91'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Mobile Number'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please enter your Mobile Number',
                  style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              Row(
                children: [
                  DropdownButton<String>(
                    value: selectedCountryCode,
                    onChanged: (value) {
                      setState(() {
                        selectedCountryCode = value;
                      });
                    },
                    items: countryCodes
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _mobileNumberController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Mobile Number',
                        errorText: errorMessage,
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final number = _mobileNumberController.text;
                  if (number.length == 10) {
                    String otp = generateOtp();

                    // Print the generated OTP to the terminal
                    // ignore: avoid_print
                    print("Generated OTP: $otp");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(
                          otp: otp,
                          mobileNumber: '$selectedCountryCode $number',
                        ),
                      ),
                    );
                  } else {
                    setState(() {
                      errorMessage = 'Please enter a valid 10-digit number';
                    });
                  }
                },
                child: const Text('GET OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String generateOtp() {
    Random random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }
}
