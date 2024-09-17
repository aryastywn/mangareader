import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides a basic layout structure
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text widget to show logout message
            Text(
              'Click Here to LogOut',
              style: TextStyle(
                fontSize: 30, // Font size of the text
                fontWeight: FontWeight.bold, // Font weight of the text
                color: Colors.pink[200], // Color of the text
              ),
            ),
            const SizedBox(height: 32), // Spacing between the text and the button
            // ElevatedButton for logging out
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page when the button is pressed
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300], // Background color of the button
                foregroundColor: Colors.white, // Text color of the button
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Padding inside the button
                textStyle: const TextStyle(fontSize: 16), // Text style of the button text
              ),
              child: const Text('Logout'), // Text displayed on the button
            ),
          ],
        ),
      ),
    );
  }
}
