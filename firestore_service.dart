import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference flashcards =
      FirebaseFirestore.instance.collection('flashcards');

  Stream<QuerySnapshot> getFlashcards() => flashcards.snapshots();

  Future<void> addFlashcard(String question, String answer) {
    return flashcards.add({'question': question, 'answer': answer});
  }

  Future<void> deleteFlashcard(String id) {
    return flashcards.doc(id).delete();
  }
}
