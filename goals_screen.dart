import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  List<String> goals = [];

  Future<void> loadGoals() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      goals = prefs.getStringList('goals') ?? [];
    });
  }

  Future<void> saveGoals() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('goals', goals);
  }

  void addGoal(String goal) {
    setState(() => goals.add(goal));
    saveGoals();
  }

  void removeGoal(int index) {
    setState(() => goals.removeAt(index));
    saveGoals();
  }

  void showGoalDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Study Goal'),
        content: TextField(controller: controller),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              addGoal(controller.text);
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadGoals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: goals.isEmpty
          ? Center(child: Text("No Goals Set"))
          : ListView.builder(
              itemCount: goals.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(goals[index]),
                trailing: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () => removeGoal(index),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showGoalDialog,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
    );
  }
}
