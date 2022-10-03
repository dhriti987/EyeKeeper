import 'package:eye_keeper/models/class.dart';

class Teacher {
  final String id;
  final int user;
  final String name;
  final String contact;
  final Class className;
  final String designation;

  Teacher({
    required this.id,
    required this.user,
    required this.name,
    required this.contact,
    required this.className,
    required this.designation,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
        id: json['id'],
        user: json['user'],
        name: json['name'],
        contact: json['contact'],
        className: Class.fromJson(json['teacher_class']),
        designation: json['designation']);
  }

  static List<Teacher> listFromJson(List<dynamic> list) =>
      List<Teacher>.from(list.map((e) => Teacher.fromJson(e)));

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "name": name,
        "contact": contact,
        "_class": className.id,
        "admission_date": designation,
      };
}
