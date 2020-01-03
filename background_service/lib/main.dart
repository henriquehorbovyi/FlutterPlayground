import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(BackgroundApp());

class BackgroundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Background Service",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeBackgroundService(),
    );
  }
}

class HomeBackgroundService extends StatefulWidget {
  HomeBackgroundService({Key key}) : super(key: key);

  @override
  _HomeBackgroundServiceState createState() => _HomeBackgroundServiceState();
}

class _HomeBackgroundServiceState extends State<HomeBackgroundService> {
  startServiceInPlatform() async {
    if (Platform.isAndroid) {
      var methodChannel = MethodChannel("io.henrikhorbovyi.services");
      String data = await methodChannel.invokeMethod("startService");
      debugPrint(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: MaterialButton(
        color: Colors.pinkAccent,
        textColor: Colors.white,
        onPressed: () {
          startServiceInPlatform();
        },
        child: Text("Start service"),
      ))),
    );
  }
}
