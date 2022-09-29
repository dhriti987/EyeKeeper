class Class {
  final int id;
  final String className;

  Class({
    required this.id,
    required this.className,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(id: json['id'], className: json['class_name']);
  }

  static List<Class> listFromJson(List<dynamic> list) =>
      List<Class>.from(list.map((e) => Class.fromJson(e)));
}
