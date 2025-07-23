import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlashcardsScreen extends StatefulWidget {
  @override
  _FlashcardsScreenState createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  final CollectionReference flashcards =
      FirebaseFirestore.instance.collection('flashcards');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: flashcards.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text('Error loading flashcards.'));
          if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());

          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final card = data[index];
              return Card(
                child: ListTile(
                  title: Text(card['question']),
                  subtitle: Text(card['answer']),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AddFlashcardDialog(),
          );
        },
      ),
    );
  }
}

class AddFlashcardDialog extends StatefulWidget {
  @override
  _AddFlashcardDialogState createState() => _AddFlashcardDialogState();
}

class _AddFlashcardDialogState extends State<AddFlashcardDialog> {
  final questionController = TextEditingController();
  final answerController = TextEditingController();

  void saveCard() {
    FirebaseFirestore.instance.collection('flashcards').add({
      'question': questionController.text,
      'answer': answerController.text,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Flashcard'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: questionController, decoration: InputDecoration(labelText: 'Question')),
          TextField(controller: answerController, decoration: InputDecoration(labelText: 'Answer')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        ElevatedButton(onPressed: saveCard, child: Text('Save')),
      ],
    );
  }
}
