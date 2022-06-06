import 'package:flutter/material.dart';
import 'package:flutter_homework/flutter/hw_week_6/strings.dart';

class MyLandmarks extends StatefulWidget {
  const MyLandmarks({Key? key}) : super(key: key);

  @override
  _MyLandmarksState createState() => _MyLandmarksState();
}

class _MyLandmarksState extends State<MyLandmarks> {

  final List<dynamic> _landmarks = [
    {
      'landmarkImage': Strings.landmarksPanteon.landmarkImage,
      'landmarkText': Strings.landmarksPanteon.landmarkText,
      'landmarkSubText': Strings.landmarksPanteon.landmarkSubText
    },
    {
      'landmarkImage': Strings.landmarksKapelle.landmarkImage,
      'landmarkText': Strings.landmarksKapelle.landmarkText,
      'landmarkSubText': Strings.landmarksKapelle.landmarkSubText
    },
    {
      'landmarkImage': Strings.landmarksKolosseum.landmarkImage,
      'landmarkText': Strings.landmarksKolosseum.landmarkText,
      'landmarkSubText': Strings.landmarksKolosseum.landmarkSubText
    },
    {
      'landmarkImage': Strings.landmarksDuomo.landmarkImage,
      'landmarkText': Strings.landmarksDuomo.landmarkText,
      'landmarkSubText': Strings.landmarksDuomo.landmarkSubText
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            Strings.appLandmarksTitle,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Color(0Xffc4a8d3),
        body: ListView.builder(
          itemCount: _landmarks.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(15),
              child: _landmarkCard(
                  _landmarks[index]['landmarkText'],
                  _landmarks[index]['landmarkImage'],
                  _landmarks[index]['landmarkSubText'],
                  screenHeight),
            );
          },
        ));
  }

  Widget _landmarkCard(
      String title, String image, String text, double height) {
    return Column(
      children: [
        SizedBox(
          height: height / 36,
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              50.0, // Change your border radius here
            ),
          ),
          tileColor: Colors.white,
          leading: GestureDetector(
            onTap: () => _showImage(context, image),
            child: Hero(
              tag: 'my-hero-animation-tag',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(image,
                      width: 110, height: 60, fit: BoxFit.fill),
                ),
                radius: 25,
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: const Color(0xff001F3F).withOpacity(.7),
            ),
          ),
          subtitle: Text(text),
        )
      ],
    );
  }

  void _showImage(BuildContext context, String img) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(
                child: Hero(
                  tag: 'my-hero-animation-tag',
                  child: Image.network(img),
                ),
              ),
            )));
  }
}
