import 'package:eye_keeper/utilities/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eye Keeper',
      theme: ThemeData.dark(),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      initialRoute: '/',
    );
  }
}
