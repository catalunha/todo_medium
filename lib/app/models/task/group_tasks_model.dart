class GroupTasksModel {
  final String date;
  final int finished;
  final int notFinished;
  GroupTasksModel({
    required this.date,
    required this.finished,
    required this.notFinished,
  });

  GroupTasksModel copyWith({
    String? date,
    int? finished,
    int? notFinished,
  }) {
    return GroupTasksModel(
      date: date ?? this.date,
      finished: finished ?? this.finished,
      notFinished: notFinished ?? this.notFinished,
    );
  }
}
