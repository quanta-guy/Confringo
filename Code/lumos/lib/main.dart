import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lumos/firebase_options.dart';
import './Login.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/first',
      routes: {
        '/first': (context) => const Mobile(),
        '/second': (context) => const loginScreen()
      },
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          shadowColor: Colors.black,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: const Center(
          child: Mobile(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  bool autoStatus = false;
  bool autoStatus1 = false;
  String path = 'assets/image/Off.png';
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Center(
            child: Container(
              child: FlutterSwitch(
                width: 50.0,
                height: 50.0,
                valueFontSize: 15.0,
                toggleSize: 10.0,
                activeTextColor: Colors.black,
                inactiveColor: Colors.black,
                activeColor: Colors.yellow,
                inactiveIcon: const Icon(
                  Icons.dark_mode_rounded,
                  color: Colors.black,
                ),
                value: autoStatus1,
                toggleColor: color,
                borderRadius: 50.0,
                padding: 5.0,
                showOnOff: true,
                switchBorder: Border.all(
                  color: Colors.black,
                ),
                activeIcon: const Icon(
                  Icons.wb_sunny,
                  color: Colors.yellow,
                ),
                onToggle: (val) {
                  setState(() {
                    autoStatus1 = val;
                    if (autoStatus1) {
                      Control(auto: true, currentStatus: false);
                      color = Colors.black87;
                    } else {
                      Control(auto: false, currentStatus: false);
                    }
                  });
                },
              ),
            ),
          ),
        ),
        Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.5,
              child: FittedBox(child: Image.asset(path))),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Center(
          child: Container(
            child: FlutterSwitch(
              width: 150.0,
              height: 70.0,
              valueFontSize: 25.0,
              toggleSize: 60.0,
              activeTextColor: Colors.black,
              inactiveColor: Colors.black,
              activeColor: Colors.yellow,
              inactiveIcon: const Icon(
                Icons.dark_mode_rounded,
                color: Colors.black,
              ),
              value: autoStatus,
              toggleColor: color,
              borderRadius: 50.0,
              padding: 5.0,
              showOnOff: true,
              switchBorder: Border.all(
                color: Colors.black,
              ),
              activeIcon: const Icon(
                Icons.wb_sunny,
                color: Colors.yellow,
              ),
              onToggle: (val) {
                setState(() {
                  autoStatus = val;
                  if (autoStatus) {
                    Control(auto: false, currentStatus: true);
                    color = Colors.black87;
                    path = 'assets/image/On.png';
                  } else {
                    Control(auto: false, currentStatus: false);
                    color = Colors.white;
                    path = 'assets/image/Off.png';
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

Future Control({required bool auto, required bool currentStatus}) async {
  final Node = await FirebaseFirestore.instance
      .collection('Users')
      .doc('xThiVuYMQ4yM1AoxHAXi')
      .get();
  var fPath = FieldPath(["NodeAdress", "Auto"]);
  var NodeData = Node.data()!;
  print(NodeData);
  final json1 = {
    'Auto': auto,
  };
  final json2 = {
    'CurrentStatus': currentStatus,
  };
  await FirebaseFirestore.instance
      .collection('Users')
      .doc('xThiVuYMQ4yM1AoxHAXi')
      .update({
    'NodeAdress': {'Auto': auto, 'CurrentStatus': currentStatus}
  });
}
