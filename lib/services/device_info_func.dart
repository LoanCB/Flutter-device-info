import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

Future<Map> initPlatformState() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> deviceData = {'error': null};

  try {
    if (Platform.isAndroid) {
      deviceData = _readAndroidData(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      deviceData = _readIosData(await deviceInfoPlugin.iosInfo);
    }
  } on PlatformException {
    deviceData = {'error:': 'Failed to get  as Objectplatform version'};
  }

  return deviceData;
}

Map<String, dynamic> _readAndroidData(AndroidDeviceInfo build) {
  return {
    'manufacturer': build.manufacturer,
    'model': build.model
  };
}

Map<String, dynamic> _readIosData(IosDeviceInfo data) {
  return {
    'manufacturer': 'Apple',
    'model': data.model
  };
}
