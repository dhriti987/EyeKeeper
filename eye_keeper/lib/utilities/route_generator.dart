import 'package:eye_keeper/screens/add_student_screen.dart';
import 'package:eye_keeper/screens/add_teacher_screen.dart';
import 'package:eye_keeper/screens/display_attendance.dart';
import 'package:eye_keeper/screens/display_student_screen.dart';
import 'package:eye_keeper/screens/display_teacher_screen.dart';
import 'package:eye_keeper/screens/home_screen.dart';
import 'package:eye_keeper/screens/login_screen.dart';
import 'package:eye_keeper/screens/student_details_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/add-teacher':
        return MaterialPageRoute(builder: (_) => const AddTeacher());

      case '/add-student':
        return MaterialPageRoute(builder: (_) => const AddStudent());

      case '/display-student':
        return MaterialPageRoute(builder: (_) => const DisplayStudent());

      case '/display-teacher':
        return MaterialPageRoute(builder: (_) => const DisplayTeacher());

      case '/display-attendance':
        return MaterialPageRoute(builder: (_) => const DisplayAttendance());

      case '/student-details':
        return MaterialPageRoute(builder: (_) => const StudentDetails());

      default:
        // If there is no such named route in the switch statement
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
