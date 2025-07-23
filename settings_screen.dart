import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text("Dark Mode"),
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
          ListTile(
            title: Text("App Version"),
            subtitle: Text("1.0.0"),
          ),
          ListTile(
            title: Text("Feedback"),
            subtitle: Text("Send feedback to studywise@app.com"),
          ),
        ],
      ),
    );
  }
}
