import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final List<String> messages = [
    'Welcome to StudyWise!',
    'Set goals and track your progress.',
    'Take quizzes and improve daily.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.school, size: 120, color: Colors.deepPurple),
                SizedBox(height: 40),
                Text(
                  messages[index],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                if (index == messages.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    },
                    child: Text('Get Started'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
