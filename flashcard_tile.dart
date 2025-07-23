import 'package:flutter/material.dart';

class FlashcardTile extends StatelessWidget {
  final String question;
  final String answer;

  const FlashcardTile({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(answer),
        )
      ],
    );
  }
}
