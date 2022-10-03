import 'package:eye_keeper/models/class.dart';

class Student {
  final String id;
  final String name;
  final String email;
  final String contact;
  final Class className;
  final String image;
  final String admissionDate;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.className,
    required this.image,
    required this.admissionDate,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        contact: json['contact'],
        className: Class.fromJson(json['student_class']),
        image: json['photo'],
        admissionDate: json['admission_date']);
  }

  static List<Student> listFromJson(List<dynamic> list) =>
      List<Student>.from(list.map((e) => Student.fromJson(e)));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "contact": contact,
        "_class": className.id,
        "photo": image,
        "admission_date": admissionDate,
      };
}
