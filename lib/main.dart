import 'package:flutter/material.dart';
import 'package:flutter_homework/dart/hw_week_6.dart';
import 'package:flutter_homework/flutter/hw_week_6/idea_details.dart';
import 'flutter/hw_week_6/best_places.dart';
import 'flutter/hw_week_6/my_notes_with_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: { '/': (context) => Ideas(),
        '/details': (context) => IdeaDetails(),},
      //home: MyLandmarks()
      //home: Cinema()
    );
  }
}