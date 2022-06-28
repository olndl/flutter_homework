import 'package:flutter/material.dart';
import 'package:flutter_homework/flutter/hw_week_9/screens/profile.dart';
import 'package:flutter_homework/flutter/hw_week_9/screens/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../flutter/hw_week_9/constants/strings.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final Color _accentColor = const Color(0xFF700E7B);

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    ifAlreadyLogin();
  }

  void ifAlreadyLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true);
    if (newUser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const UserScreen()));
    }
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
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(190.0),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _miniLogo(),
                  _title(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _subTitle(),
                  const SizedBox(
                    height: 20,
                  ),
                  _bigLogo(),
                  const SizedBox(
                    height: 10,
                  ),
                  _hint(),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      _login(),
                      _password(),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _button(),
                  _notAccount()
                ],
              ))
        ]));
  }

  Widget _miniLogo() {
    return const Image(
        width: 100, height: 100, image: AssetImage(Strings.imageProfile));
  }

  Widget _title() {
    return const Text(
      Strings.welcome,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _subTitle() {
    return const Text(
      Strings.subTitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _bigLogo() {
    return const Image(
      image: AssetImage(Strings.bigImage),
      height: 200,
      width: 200,
    );
  }

  Widget _hint() {
    return const Text(
      Strings.hintText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _login() {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: Material(
        elevation: 20.0,
        shadowColor: _accentColor,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) return Strings.email;
            return null;
          },
          autofocus: false,
          decoration: InputDecoration(
              hintText: Strings.emailHint,
              prefixIcon: const Icon(Icons.mail, color: Color(0xFF700E7B)),
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: Colors.white, width: 3.0))),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: Material(
        elevation: 20.0,
        shadowColor: _accentColor,
        child: TextFormField(
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value!.isEmpty) return Strings.password;
            return null;
          },
          obscureText: true,
          autofocus: false,
          decoration: InputDecoration(
              hintText: Strings.passwordHint,
              prefixIcon: const Icon(Icons.lock, color: Color(0xFF700E7B)),
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: Colors.white, width: 3.0))),
        ),
      ),
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        String mail = _emailController.text;
        String password = _passwordController.text;
        if (_formKey.currentState!.validate()) {
          if (mail == loginData.getString('mail') &&
              password == loginData.getString('pswd')) {
            loginData.setBool('login', false);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserScreen()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(Strings.wrongMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
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
            Strings.buttonSignIn,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _notAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          Strings.notAccount,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpScreen()));
            },
            child: const Text(
              "Create",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
