import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

class Feed extends StatelessWidget {
  Feed({Key? key}) : super(key: key);

  // from stackoverflow:
  // https://stackoverflow.com/questions/54138750/total-distance-calculation-from-latlng-list
  // the function to calculate distance between two geographical points (lat, long)
  double distance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  List<dynamic> doodles = [
    {"id": 460, "lat": 44.968046, "lng": -94.420307},
    {"id": 420, "lat": 44.33328, "lng": -89.132008},
    {"id": 496, "lat": 33.755787, "lng": -116.359998},
    {"id": 69, "lat": 33.844843, "lng": -116.54911},
    {"id": 90, "lat": 44.92057, "lng": -93.44786},
    {"id": 60, "lat": 44.240309, "lng": -91.493619},
    {"id": 110, "lat": 44.968041, "lng": -94.419696},
    {"id": 111, "lat": 44.333304, "lng": -89.132027},
    {"id": 123, "lat": 33.755783, "lng": -116.360066},
  ];

  var userLocation = {"lat": 33.844847, "lng": -116.549069};

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              children: [
                Container(),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Post(),
                      Post(),
                      Post(),
                      Post(),
                    ],
                  ),
                ))
              ],
            ),
          ),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white
    // ));

    const TextStyle usernameStyle =
        TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
    const TextStyle captionStyle =
        TextStyle(fontSize: 14, color: Colors.black54);

    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              image: const DecorationImage(
                  image: AssetImage('assets/images/post--1.png'),
                  fit: BoxFit.fill)),
        ),
        Row(
          children: [
            Container(
                height: 35,
                width: 35,
                margin: const EdgeInsets.only(top: 10, right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    // color: Colors.grey,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/saad.jpg'),
                    ))),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      child: const Text(
                        'Saad Ashraf',
                        style: usernameStyle,
                      ),
                    ),
                    const Text(
                      'AR Doodle Rules',
                      style: captionStyle,
                    )
                  ],
                ),
              ),
            ),
            const Icon(
              MdiIcons.heartOutline,
              color: Colors.grey,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
        )
      ],
    );
  }
}
