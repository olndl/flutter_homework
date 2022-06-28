import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/flutter/hw_week_9/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../flutter/hw_week_9/constants/strings.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final Color _accentColor = const Color(0xFF700E7B);

  late SharedPreferences loginData;
  String? name;
  String? lastName;
  String? mail;
  String? number;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      name = loginData.getString('name');
      lastName = loginData.getString('surname');
      mail = loginData.getString('mail');
      number = loginData.getString('ph');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(fit: StackFit.expand, children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(100.0),
                    bottomLeft: Radius.circular(100.0),
                  ),
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [_accentColor.withOpacity(.5), _accentColor],
                      stops: const [.0, 1])),
            ),
          ),
          Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  children: <Widget>[
                    Center(child: _titleProfile('$name')),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: _avatar(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _about(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 0.6,
                      color: Colors.purple,
                    ),
                    _contacts(),
                    const SizedBox(
                      height: 20,
                    ),
                    _button()
                  ],
                ),
              )),
        ]));
  }

  Widget _avatar() {
    return const AvatarView(
      radius: 84,
      borderWidth: 8,
      borderColor: Color(0xADD5D4D4),
      avatarType: AvatarType.CIRCLE,
      imagePath: Strings.imageUser,
    );
  }

  Widget _titleProfile(String firstName) {
    return Text(
      "Hello, $firstName!",
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _about() {
    return Column(
      children: [
        const Text(
          Strings.about,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'First Name: $name',
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w200,
          ),
        ),
        Text(
          'Last Name: $lastName',
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }

  Widget _contacts() {
    return Column(
      children: [
        const Text(
          Strings.contact,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Email: $mail',
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w200,
          ),
        ),
        Text(
          'Phone Number: $number',
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        loginData.setBool('login', true);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInScreen()));
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFF700E7B), Color(0xFFB082B6)]),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: 150,
          height: 40,
          alignment: Alignment.center,
          child: const Text(
            Strings.buttonLogOut,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
