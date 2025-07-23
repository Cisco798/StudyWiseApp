class GoalModel {
  final String title;
  final bool isCompleted;

  GoalModel({
    required this.title,
    this.isCompleted = false,
  });

  factory GoalModel.fromMap(Map<String, dynamic> data) {
    return GoalModel(
      title: data['title'],
      isCompleted: data['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}
