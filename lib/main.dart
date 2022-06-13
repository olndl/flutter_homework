import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/dart/hw_week_6.dart';
import 'package:flutter_homework/flutter/hw_week_6/idea_details.dart';
import 'package:flutter_homework/flutter/hw_week_7/pet_owner_registration_screen.dart';
import 'flutter/hw_week_6/best_places.dart';
import 'flutter/hw_week_6/my_notes_with_details.dart';
import 'flutter/hw_week_7/pet_registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
        routes: { '/': (context) => const PetOwnerRegistrationScreen(),
         '/pet': (context) => const PetRegistrationScreen(),},
      //home: MyLandmarks()
      //home: Cinema()
    );
  }
}