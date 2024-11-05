import 'package:flutter/material.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Selection'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please select your Profile',
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedProfile = 'Shipper';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: selectedProfile == 'Shipper'
                        ? Colors.blue[100]
                        : Colors.white,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.local_shipping, size: 40),
                      SizedBox(width: 10),
                      Text('Shipper'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedProfile = 'Transporter';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: selectedProfile == 'Transporter'
                        ? Colors.blue[100]
                        : Colors.white,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.directions_car, size: 40),
                      SizedBox(width: 10),
                      Text('Transporter'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: selectedProfile == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                child: Text('NEXT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
