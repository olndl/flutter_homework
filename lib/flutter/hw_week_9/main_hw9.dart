import 'package:flutter/material.dart';
import 'package:flutter_homework/flutter/hw_week_9/screens/sign_in_screen.dart';

void main() => runApp(const ChatApp());


class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SignInScreen(),
    );
  }

}