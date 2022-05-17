import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter__dummy_geofencing/doodles.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ARDraw extends StatefulWidget {
  const ARDraw({Key? key}) : super(key: key);

  @override
  State<ARDraw> createState() => _ARDrawState();
}

class _ARDrawState extends State<ARDraw> {
  @override
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  late UnityWidgetController _unityWidgetController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unityWidgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Card(
            margin: const EdgeInsets.all(8),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                UnityWidget(
                  onUnityCreated: _onUnityCreated,
                  onUnityMessage: onUnityMessage,
                  onUnitySceneLoaded: onUnitySceneLoaded,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: <Widget>[
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: const Text("Rotation speed:"),
                        ),
                        ElevatedButton(
                          onPressed: () => displayVal("HAmiz"),
                          child: Text("send message"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void displayVal(String speed) {
    _unityWidgetController.postMessage(
      'Panel',
      'displayVal',
      speed,
    );
    print("dhasjh");
  }

  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  void onUnitySceneLoaded(SceneLoaded? scene) {
    print('Received scene loaded from unity: ${scene?.name}');
    print('Received scene loaded from unity buildIndex: ${scene?.buildIndex}');
  }

  // Callback that connects the created controller to the unity controller
  void _onUnityCreated(controller) {
    controller.resume();
    this._unityWidgetController = controller;
    print("asdsada");
  }
}

// class ARDraw extends StatelessWidget {
//   const ARDraw({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

//     // UnityWidgetController _unityWidgetController;
//     return Scffold(
//       // Please enter the Unity widget here
//       // body:

//       body: Column(
//         children: const [Text('')],
//       ),
//       backgroundColor: Colors.black,
//     );
//   }

// }

class ARMain extends StatelessWidget {
  ARMain({Key? key}) : super(key: key);
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(15.0),
    topRight: Radius.circular(15.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panel: Doodles(),
        collapsed: Container(
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: radius),
            child: Column(
              children: [
                Container(
                  height: 3,
                  width: 30,
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(60, 0, 0, 0),
                      borderRadius: BorderRadius.circular(30)),
                ),
                Center(
                  child: Text(
                    "Explore Doodles",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )),
        body: ARDraw(),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        maxHeight: 280,
        minHeight: 75,
      ),
    );
  }
}
