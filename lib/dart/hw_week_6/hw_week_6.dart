import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_homework/dart/hw_week_6/strings.dart';

class Cinema extends StatefulWidget {
  const Cinema({Key? key}) : super(key: key);

  @override
  _CinemaState createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> {
  String response = '';
  String nameClient = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(screenWidth / 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset(Strings.animation),
              _text(Strings.title),
              SizedBox(
                height: screenHeight / 35,
              ),
              _textEditName(),
              SizedBox(
                height: screenHeight / 50,
              ),
              _textEditAge(),
              SizedBox(
                height: screenHeight / 35,
              ),
              _text(nameClient + ' ' + response)
            ],
          ),
        ));
  }

  _answer(double age) {
    return age < 16
        ? Strings.deny
        : (age > 18 ? Strings.admit : Strings.partAdmit);
  }

  Widget _text(String txt) {
    return Text(
      txt,
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    );
  }

  Widget _textEditName() {
    return TextField(
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.singleLineFormatter
      ],
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black, width: 1.2)),
        labelText: Strings.yourName,
        prefixIcon: Icon(Icons.drive_file_rename_outline),
      ),
      onSubmitted: (String strName) {
        setState(() {
          if (strName != '') {
            nameClient = Strings.hello + strName + '!';
          }
        });
      },
    );
  }

  Widget _textEditAge() {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black, width: 1.2)),
        labelText: Strings.yourAge,
        prefixIcon: Icon(Icons.calendar_today_outlined),
      ),
      onSubmitted: (String str) {
        setState(() {
          response = _answer(double.parse(str));
        });
      },
    );
  }
}
