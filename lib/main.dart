import 'package:device_infos/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterDeviceInfo());
}

class FlutterDeviceInfo extends StatelessWidget {
  const FlutterDeviceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
