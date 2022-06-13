import 'package:flutter_homework/flutter/hw_week_7/components/strings.dart';
import 'package:flutter/material.dart';
import 'components/body/body_pet_screen.dart';

enum Gender { male, female }

class PetRegistrationScreen extends StatelessWidget {
  const PetRegistrationScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var message = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Body(),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        Strings.appName,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'Meows',
            fontWeight: FontWeight.bold),
      )
    );
  }
}