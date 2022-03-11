import 'dart:convert';

class TaskModel {
  final String uuid;
  final String description;
  final DateTime date;
  final bool finished;
  TaskModel({
    required this.uuid,
    required this.description,
    required this.date,
    required this.finished,
  });

  TaskModel copyWith({
    String? uuid,
    String? description,
    DateTime? date,
    bool? finished,
  }) {
    return TaskModel(
      uuid: uuid ?? this.uuid,
      description: description ?? this.description,
      date: date ?? this.date,
      finished: finished ?? this.finished,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'description': description,
      'date': date,
      'finished': finished,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      uuid: map['uuid'] ?? '',
      description: map['description'] ?? '',
      // date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      date: DateTime.fromMillisecondsSinceEpoch(
          map['date'].millisecondsSinceEpoch),
      finished: map['finished'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModel(uuid: $uuid, description: $description, date: $date, finished: $finished)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel &&
        other.uuid == uuid &&
        other.description == description &&
        other.date == date &&
        other.finished == finished;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        description.hashCode ^
        date.hashCode ^
        finished.hashCode;
  }
}
