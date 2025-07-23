import 'package:flutter/material.dart';
import '../services/notes_database.dart';

class NotesProvider with ChangeNotifier {
  List<Map<String, dynamic>> _notes = [];

  List<Map<String, dynamic>> get notes => _notes;

  Future<void> fetchNotes() async {
    _notes = await NotesDatabase.fetchNotes();
    notifyListeners();
  }

  Future<void> addNote(String title, String content) async {
    await NotesDatabase.insertNote(title, content);
    await fetchNotes();
  }

  Future<void> deleteNote(int id) async {
    await NotesDatabase.deleteNote(id);
    await fetchNotes();
  }
}
