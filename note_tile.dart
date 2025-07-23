import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onDelete;

  const NoteTile({
    required this.title,
    required this.content,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(content),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
