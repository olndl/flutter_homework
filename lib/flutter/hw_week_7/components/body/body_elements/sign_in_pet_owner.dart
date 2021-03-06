import 'package:flutter/material.dart';
import 'package:flutter_homework/flutter/hw_week_7/components/strings.dart';

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

class SignInPetOwner extends StatefulWidget {
  const SignInPetOwner({Key? key}) : super(key: key);

  @override
  State<SignInPetOwner> createState() => SignInPetOwnerState();
}

class SignInPetOwnerState extends State<SignInPetOwner> {
  String valueName = '';
  final _formKey = GlobalKey<FormState>();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _title(),
            _firstNameForm(),
            _lastNameNameForm(),
            _emailForm(),
            _phoneNumberForm(),
            const SizedBox(
              height: 20,
            ),
            _buttonNext()
          ],
        ));
  }

  Widget _title() {
    return const Text(Strings.subTitleScreen,
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18));
  }

  Widget _firstNameForm() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      child: TextFormField(
        keyboardType: TextInputType.name,
        controller: _controller,
        onFieldSubmitted: (value) {
          setState(() {
            valueName = value;
          });
        },
        validator: (value) {
          if (value!.isEmpty) return Strings.yourFirstName;
          return null;
        },
        decoration: InputDecoration(
          labelText: Strings.firstName,
          hintText: Strings.yourFirstName,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Icon(Icons.drive_file_rename_outline),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff000000)),
              gapPadding: 10),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
        ),
      ),
    );
  }

  Widget _lastNameNameForm() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      child: TextFormField(
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) return Strings.yourLastName;
          return null;
        },
        decoration: InputDecoration(
          labelText: Strings.lastName,
          hintText: Strings.yourLastName,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Icon(Icons.drive_file_rename_outline),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
        ),
      ),
    );
  }

  Widget _phoneNumberForm() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value!.isEmpty) return Strings.yourPhoneNumber;
          if (!value.isPhoneNumber()) {
            return 'this is not ' + Strings.phoneNumber;
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: Strings.phoneNumber,
          hintText: 'enter your '+Strings.phoneNumber,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Icon(Icons.phone),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
        ),
      ),
    );
  }

  Widget _emailForm() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) return 'please, '+Strings.enterEmail;
          if (!value.isEmail()) return Strings.notEmail;
          return null;
        },
        decoration: InputDecoration(
          labelText: Strings.email,
          hintText: Strings.enterEmail,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Icon(Icons.mail_outline),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Color(0xff8b8b8b)),
              gapPadding: 10),
        ),
      ),
    );
  }

  Widget _buttonNext() {
    return SizedBox(
      height: 50.0,
      width: 250.0,
      child: GestureDetector(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, '/pet', arguments: valueName);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 0.8,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Center(
                child: Text(
                  Strings.continueButton,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
