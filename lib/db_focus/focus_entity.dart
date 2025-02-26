import 'package:intl/intl.dart';

class FocusEntity {
  int id;
  DateTime createdTime;
  String name;
  int minutes;

  FocusEntity({
    required this.id,
    required this.createdTime,
    required this.name,
    required this.minutes,
  });

  factory FocusEntity.fromJson(Map<String, dynamic> json) {
    return FocusEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      name: json['name'],
      minutes: json['minutes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'name': name,
      'minutes': minutes,
    };
  }

  String get createdTimeString {
    return DateFormat('yyyy-MM-dd HH:mm').format(createdTime);
  }
}