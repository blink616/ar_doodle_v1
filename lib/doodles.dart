import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

class Doodles extends StatelessWidget {
  Doodles({Key? key}) : super(key: key);

  // from stackoverflow:
  // https://stackoverflow.com/questions/54138750/total-distance-calculation-from-latlng-list
  // the function to calculate distance between two geographical points (lat, long)
  // the unit of distance is meters
  double distance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 1000 * 12742 * asin(sqrt(a));
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

    double radius = 100000;

    List<dynamic> doodlesNearby = doodles.where((item) {
      double doodleDistance = distance(
          userLocation["lat"], userLocation["lng"], item["lat"], item["lng"]);
      return doodleDistance < radius;
    }).toList();

    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                Container(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Row(
                      children: [
                        for (var doodle in doodlesNearby)
                          DoodleCard(title: doodle['id'].toString())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}

class DoodleCard extends StatelessWidget {
  DoodleCard({
    Key? key,
    this.id = 0,
    this.title = 'none',
  }) : super(key: key);

  int id;
  String title;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white
    // ));

    const TextStyle usernameStyle =
        TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
    const TextStyle captionStyle =
        TextStyle(fontSize: 14, color: Colors.black54);

    return Container(
      width: 300,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
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
              // Container(
              //     height: 35,
              //     width: 35,
              //     margin: const EdgeInsets.only(top: 10, right: 5),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         // color: Colors.grey,
              //         image: const DecorationImage(
              //           image: AssetImage('assets/images/saad.jpg'),
              //         ))),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          title,
                          style: usernameStyle,
                        ),
                      ),
                      const Text(
                        'Doodle Data',
                        style: captionStyle,
                      )
                    ],
                  ),
                ),
              ),
              const Icon(
                MdiIcons.cameraIris,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
