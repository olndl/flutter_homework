import 'package:flutter/material.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter_homework/flutter/hw_week_9/screens/profile.dart';
import 'package:flutter_homework/flutter/hw_week_9/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../flutter/hw_week_9/constants/strings.dart';


extension EmailValidator on String {
  bool isEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PhoneValidator on String {
  bool isPhoneNumber() {
    return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
        .hasMatch(this);
  }
}


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final Color _accentColor = const Color(0xFF700E7B);
  var _agreement = false;

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  String? firstName;
  String? lastName;
  String? emailAddress;
  String? mobilePhone;
  String? password;


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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  _avatar(),
                  Form(
                      key: _formKey,
                      child: Column(
                    children: [
                      _firstName(),
                      _lastName(),
                      _login(),
                      _mobile(),
                      _password(),
                      _agreementBox(),
                    ],
                  )),
                  _button()
                ],
              )
          ),
          Positioned(
              top: 170,
              left: 0,
              right: 110,
              child: FloatingActionButton(onPressed: () {  },
                mini: true,
              child: const Icon(Icons.add),)
          ),

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

  Widget _firstName() {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 10, 50, 2),
      child: Material(
        elevation: 20.0,
        shadowColor: _accentColor,
        child: TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value!.isEmpty) return Strings.name;
            return null;
          },
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.drive_file_rename_outline, color: Color(0xFF700E7B)),
              hintText: Strings.nameHint,
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.white, width: 3.0))
          ),
        ),
      ),
    );
  }

  Widget _lastName() {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 10, 50, 2),
      child: Material(
        elevation: 20.0,
        shadowColor: _accentColor,
        child: TextFormField(
          controller: _lastNameController,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value!.isEmpty) return Strings.surname;
            return null;
          },
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.drive_file_rename_outline, color: Color(0xFF700E7B)),
              hintText: Strings.surnameHint,
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.white, width: 3.0))
          ),
        ),
      ),
    );
  }

  Widget _mobile() {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 10, 50, 2),
      child: Material(
        elevation: 20.0,
        shadowColor: _accentColor,
        child: TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) return Strings.phone;
            if (!value.isPhoneNumber()) {
              return Strings.notPhone;
            }
            return null;
          },
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone, color: Color(0xFF700E7B)),
              hintText: Strings.phoneHint,
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.white, width: 3.0))
          ),
        ),
      ),
    );
  }

  Widget _login() {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 10, 50, 2),
      child: Material(
        elevation: 20.0,
        shadowColor: _accentColor,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) return Strings.email;
            if (!value.isEmail()) return Strings.notEmail;
            return null;
          },
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.mail, color: Color(0xFF700E7B)),
              hintText: Strings.emailHint,
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.white, width: 3.0))
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return  Container(
      margin: const EdgeInsets.fromLTRB(50, 10, 50, 2),
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
              prefixIcon: const Icon(Icons.lock, color: Color(0xFF700E7B)),
              hintText: Strings.passwordHint,
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.white, width: 3.0))
          ),
        ),
      ),
    );
  }

  Widget _agreementBox() {
    return Container(
        margin: const EdgeInsets.fromLTRB(50, 10, 50, 2),
    child: CheckboxListTile(
        value: _agreement,
        title: const Text(Strings.acceptTerms, textAlign: TextAlign.center,style: TextStyle(fontSize: 12)),
        onChanged: (bool? value) =>
            setState(() => _agreement = value!)));
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: ()  {
        String name = _nameController.text;
        String lastName = _lastNameController.text;
        String mail = _emailController.text;
        String password = _passwordController.text;
        String mobile = _phoneController.text;
        String pswd = _passwordController.text;
        if (_formKey.currentState!.validate()) {
          if (_agreement == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(Strings.accept),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            if (mail.isNotEmpty && password.isNotEmpty) {
              loginData.setBool('login', false);
              loginData.setString('name', name);
              loginData.setString('surname', lastName);
              loginData.setString('mail', mail);
              loginData.setString('ph', mobile);
              loginData.setString('pswd', pswd);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()));
            }
          }
        }
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20))),
      child: Ink(
        decoration: BoxDecoration(
            gradient:
            const LinearGradient(colors:[Color(0xFF700E7B), Color(0xFFB082B6)]),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: 150,
          height: 40,
          alignment: Alignment.center,
          child: const Text(
            Strings.buttonSignIn,
            style:
            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }


}

