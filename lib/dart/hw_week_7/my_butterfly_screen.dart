import 'package:flutter/material.dart';
import 'package:flutter_homework/dart/hw_week_7/strings.dart';
import 'package:flutter_homework/dart/hw_week_7/butterfly.dart';

class MyButterfly extends StatefulWidget {
  const MyButterfly({Key? key}) : super(key: key);

  @override
  _MyButterflyState createState() => _MyButterflyState();
}

class _MyButterflyState extends State<MyButterfly> {

  TextEditingController controller = TextEditingController();

  final List<Butterfly> _searchResult = [];

  final List<Butterfly> _data =  [
    Butterfly(Strings.krapivnitsa.name, Strings.krapivnitsa.image, Strings.krapivnitsa.text),
    Butterfly(Strings.pavliniGlaz.name, Strings.pavliniGlaz.image, Strings.pavliniGlaz.text),
    Butterfly(Strings.kapustnitsa.name, Strings.kapustnitsa.image, Strings.kapustnitsa.text),
    Butterfly(Strings.golubyankaAlexis.name, Strings.golubyankaAlexis.image, Strings.golubyankaAlexis.text),
    Butterfly(Strings.perelivnitsa.name, Strings.perelivnitsa.image, Strings.perelivnitsa.text),
    Butterfly(Strings.golubyankaArgus.name, Strings.golubyankaArgus.image, Strings.golubyankaArgus.text),
    Butterfly(Strings.traurnitsa.name, Strings.traurnitsa.image, Strings.traurnitsa.text),
    Butterfly(Strings.chervonets.name, Strings.chervonets.image, Strings.chervonets.text),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appBar(),
        backgroundColor: Colors.blue[100],
        body: Column(
            children: [
              _searchLine(),
              SizedBox(
            height: screenHeight / 2.5,

            child: _searchResult.isEmpty ? _cards(Strings.notExist, Colors.white.withOpacity(.5), screenWidth) :
            (_searchResult.length == 1 ? Column(children: [_cards(_searchResult[0].getName(),Colors.deepPurple.withOpacity(.5), screenWidth),
            _butterflyInfo(_searchResult[0].getName(), _searchResult[0].getImage(), _searchResult[0].getText(), screenHeight)],) :
            (controller.text.isNotEmpty
                    ? ListView.builder(
                itemCount: _searchResult.length,
                itemBuilder: (context, index) {
                  return _cards(_searchResult[index].getName(), Colors.white.withOpacity(.5), screenWidth);
                })
                :
            ListView.builder(
                itemCount: _data.length,
                itemBuilder: (context, index) {
                      return _cards(_data[index].getName(), Colors.white.withOpacity(.5), screenWidth);
                })
            )
            )
          )

        ]));
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var userDetail in _data) {
      if (userDetail.getName().contains(text)) {
        _searchResult.add(userDetail);
      }
    }

    setState(() {});
  }


  _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        Strings.titleApp,
        style: TextStyle(
          fontFamily: 'Caveat',
          fontSize: 70,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = const Color(0xff001F3F).withOpacity(.7),
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _searchLine() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: ListTile(
        leading:  const Icon(Icons.search),
        title: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              hintText: Strings.search, border: InputBorder.none),
          onChanged: onSearchTextChanged,
        ),
        trailing: IconButton(icon: const Icon(Icons.cancel), onPressed: () {
          controller.clear();
          onSearchTextChanged('');
        },),
      ),
    );

  }

  Widget _cards(String title, Color color, double width) {
    return Container(
      margin: EdgeInsets.fromLTRB(width / 20, width / 20, width / 20, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
          color: const Color(0xff001F3F).withOpacity(.7),
        ),
      ),
    );
  }

  Widget _butterflyInfo(
      String title, String image, String text, double height) {
    return Column(
      children: [
        SizedBox(
          height: height / 36,
        ),
        ListTile(
          leading: GestureDetector(
            onTap: () => _showButterfly(context, image),
            child: Hero(
              tag: 'my-hero-animation-tag',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(image, width: 130, fit: BoxFit.fill),
                ),
                radius: 35,
              ),
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: const Color(0xff001F3F).withOpacity(.7),
            ),
          ),
        )
      ],
    );
  }

  void _showButterfly(BuildContext context, String img) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Hero(
              tag: 'my-hero-animation-tag',
              child: Image.asset(img),
            ),
          ),
        )));
  }
}
