import 'dart:convert';

class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;
  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (note != null) {
      result.addAll({'note': note});
    }
    if (isCompleted != null) {
      result.addAll({'isCompleted': isCompleted});
    }
    if (date != null) {
      result.addAll({'date': date});
    }
    if (startTime != null) {
      result.addAll({'startTime': startTime});
    }
    if (endTime != null) {
      result.addAll({'endTime': endTime});
    }
    if (color != null) {
      result.addAll({'color': color});
    }
    if (remind != null) {
      result.addAll({'remind': remind});
    }
    if (repeat != null) {
      result.addAll({'repeat': repeat});
    }

    return result;
  }

  Task.fromJson(Map<String, dynamic> Json) {
    id = Json['id']?.toInt();
    title = Json['title'];
    note = Json['note'];
    isCompleted = Json['isCompleted']?.toInt();
    date = Json['date'];
    startTime = Json['startTime'];
    endTime = Json['endTime'];
    color = Json['color']?.toInt();
    remind = Json['remind']?.toInt();
    repeat = Json['repeat'];
  }
}
