import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int totalGoals = 0;
  int completedGoals = 0;

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final goals = prefs.getStringList('goals') ?? [];
    final completed = prefs.getStringList('completed_goals') ?? [];
    setState(() {
      totalGoals = goals.length;
      completedGoals = completed.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = totalGoals == 0 ? 0.0 : completedGoals / totalGoals;

    return Scaffold(
      appBar: AppBar(title: Text("Progress Tracker"), backgroundColor: Colors.deepPurple),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: totalGoals == 0
            ? Center(child: Text("No goals set yet."))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Study Progress", style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Text("$completedGoals out of $totalGoals goals completed"),
                  SizedBox(height: 30),
                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 12,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  ),
                  SizedBox(height: 20),
                  Text("${(progress * 100).toStringAsFixed(1)}% Completed"),
                ],
              ),
      ),
    );
  }
}
