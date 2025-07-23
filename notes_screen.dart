import 'package:flutter/material.dart';
import '../services/notes_database.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Map<String, dynamic>> notes = [];

  void loadNotes() async {
    final data = await NotesDatabase.fetchNotes();
    setState(() => notes = data);
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  void showAddNoteDialog() {
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Add Note"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: contentController, decoration: InputDecoration(labelText: 'Content')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () async {
              await NotesDatabase.insertNote(
                titleController.text,
                contentController.text,
              );
              Navigator.pop(context);
              loadNotes();
            },
          )
        ],
      ),
    );
  }

  void deleteNote(int id) async {
    await NotesDatabase.deleteNote(id);
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notes.isEmpty
          ? Center(child: Text('No Notes Yet.'))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(notes[index]['title']),
                subtitle: Text(notes[index]['content']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteNote(notes[index]['id']),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddNoteDialog,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
    );
  }
}
