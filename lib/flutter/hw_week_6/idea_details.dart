import 'package:flutter/material.dart';

class IdeaDetails extends StatefulWidget {
  const IdeaDetails({Key? key}) : super(key: key);

  @override
  _IdeaDetailsState createState() => _IdeaDetailsState();
}

class _IdeaDetailsState extends State<IdeaDetails> {
  @override
  Widget build(BuildContext context) {
    var message = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: _appBar(message),
    );
  }

  _appBar(String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 27,
            color: Colors.black.withOpacity(.6),
            fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
    );
  }
}
