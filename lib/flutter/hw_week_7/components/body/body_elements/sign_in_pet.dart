import 'package:flutter_homework/flutter/hw_week_7/components/strings.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class SignInPet extends StatefulWidget {
  const SignInPet({Key? key}) : super(key: key);

  @override
  State<SignInPet> createState() => SignInPetState();
}

class SignInPetState extends State<SignInPet> {
  String valueName = '';
  Gender? _gender;
  var _agreementDryFood = false;
  var _agreementWetFood = false;
  var _agreementNaturalFood = false;
  final _formKey = GlobalKey<FormState>();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _title(),
            _petNameForm(),
            _petBreedNameForm(),
            const Divider(
              thickness: 0.7,
              color: Color(0xff797777),
            ),
            const Text(Strings.gen,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
            _radioButton(),
            const Divider(
              thickness: 0.7,
              color: Color(0xff797777),
            ),
            const Text("feed",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
            CheckboxListTile(
                value: _agreementDryFood,
                title: const Text(Strings.food1, style: TextStyle(fontSize: 12)),
                onChanged: (bool? value) =>
                    setState(() => _agreementDryFood = value!)),
            CheckboxListTile(
                value: _agreementWetFood,
                title: const Text(Strings.food2, style: TextStyle(fontSize: 12)),
                onChanged: (bool? value) =>
                    setState(() => _agreementWetFood = value!)),
            CheckboxListTile(
                value: _agreementNaturalFood,
                title: const Text(Strings.food3, style: TextStyle(fontSize: 12)),
                onChanged: (bool? value) =>
                    setState(() => _agreementNaturalFood = value!)),
            const SizedBox(
              height: 12,
            ),
            _buttonSave()
          ],
        ));
  }

  Widget _title() {
    return const Text(Strings.subTitleScreen,
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18));
  }

  Widget _petNameForm() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 5),
      child: TextFormField(
        keyboardType: TextInputType.name,
        controller: _controller,
        onSaved: (value) {
          valueName = value!;
        },
        validator: (value) {
          if (value!.isEmpty) return Strings.enterPetName;
          return null;
        },
        decoration: InputDecoration(
          labelText: Strings.petName,
          hintText: Strings.enterPetName,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Icon(Icons.pets),
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

  Widget _petBreedNameForm() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: TextFormField(
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) return 'please, '+ Strings.enterBreed;
          return null;
        },
        decoration: InputDecoration(
          labelText: Strings.breed,
          hintText: Strings.enterBreed,
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

  Widget _radioButton() {
    return Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: RadioListTile(
            title: const Text(Strings.male, style: TextStyle(fontSize: 12)),
            value: Gender.male,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                if (value != null) _gender = value;
              });
            },
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: RadioListTile(
            title: const Text(Strings.female, style: TextStyle(fontSize: 12)),
            value: Gender.female,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                if (value != null) _gender = value;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _buttonSave() {
    return SizedBox(
      height: 50.0,
      width: 250.0,
      child: GestureDetector(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            Color color = Colors.red;
            String text;

            if (_gender == null) {
              text = Strings.genNotSelected;
            } else if (_agreementDryFood == false &&
                _agreementWetFood == false &&
                _agreementNaturalFood == false) {
              text = Strings.foodNotSelected;
            } else {
              text = Strings.great;
              color = Colors.green;
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(text),
                backgroundColor: color,
              ),
            );
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
                  Strings.save,
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
