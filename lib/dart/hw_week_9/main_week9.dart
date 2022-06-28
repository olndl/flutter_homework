
import 'package:flutter/material.dart';

import 'Screen.dart';

void main() {
  runApp(const MyTimer());
}

class MyTimer extends StatelessWidget {
  const MyTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intl Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
  }
