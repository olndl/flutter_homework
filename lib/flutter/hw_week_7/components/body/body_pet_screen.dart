import 'package:flutter/material.dart';
import 'package:flutter_homework/flutter/hw_week_7/components/body/body_elements/sign_in_pet.dart';
import 'package:flutter_homework/flutter/hw_week_7/components/body/body_elements/sign_in_pet_owner.dart';
import 'package:flutter_homework/flutter/hw_week_7/components/strings.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
         width: double.infinity,
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: SafeArea(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: const [
                 Text(
                   Strings.titleScreen,
                   style: TextStyle(
                     color: Colors.black,
                     fontFamily: 'Roboto',
                     fontSize: 15,
                   ),
                   textAlign: TextAlign.center,
                 ),
                 SizedBox(height: 10,),
                 SignInPet(),
               ],
             )));
  }
}
