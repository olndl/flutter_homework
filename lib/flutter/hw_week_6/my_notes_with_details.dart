import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_homework/flutter/hw_week_6/strings.dart';

class Ideas extends StatefulWidget {
  const Ideas({Key? key}) : super(key: key);

  @override
  _IdeasState createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  final Set<String> _ideas = {};

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: _appBar(),
        body: Stack(
          children: [
            _backgroundColor(),
            _textEditIdea(context, screenWidth),
            Positioned(
                top: screenHeight / 4.5,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView.builder(
                    itemCount: _ideas.length,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (BuildContext context, int index) {
                      return _cards(_ideas.elementAt(index), screenWidth);
                    }))
          ],
        ));
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        Strings.appIdeasTitle,
        style: TextStyle(
            fontSize: 43,
            fontFamily: 'PermanentMarker',
            color: Color(0xffb1e1ec),
            fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
    );
  }

  Widget _backgroundColor() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffB3F5FC),
        Color(0xffffffff),
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
    );
  }

  Widget _textEditIdea(BuildContext context, double width) {
    return Container(
        padding: EdgeInsets.fromLTRB(width / 8, width / 7, width / 8, 0),
        child: TextField(
          controller: TextEditingController(),
          keyboardType: TextInputType.text,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.singleLineFormatter,
          ],
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Color(0xffb1e1ec), width: 4)),
            labelText: Strings.listOfIdeas.idea,
            prefixIcon: const Icon(Icons.textsms_outlined),
          ),
          onSubmitted: (String str) {
            setState(() {
              if (str != '') {
                _ideas.add(str);
              }
            });
          },
        ));
  }

  Widget _cards(String title, double width) {
    return Container(
        margin: EdgeInsets.fromLTRB(width / 20, width / 20, width / 20, 0),
        padding: EdgeInsets.all(width / 20),
        height: width / 4.4,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              width: width / 2,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
            ),
            _buttonDetails(title),
          ],
        ));
  }

  Widget _buttonDetails(String title) {
    return FloatingActionButton(
      mini: true,
      child: const Icon(Icons.arrow_circle_right_outlined),
      backgroundColor: Colors.white.withOpacity(.5),
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: title,
        );
      },
    );
  }
}
