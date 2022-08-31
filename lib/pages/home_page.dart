import 'package:device_infos/services/device_info_func.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
          future: initPlatformState(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('error : ${snapshot.error} \n\n ${snapshot.stackTrace}', textAlign: TextAlign.center,),
              );
            } else {
              return Column(
                children: [
                  Text(snapshot.data['manufacturer']),
                  Text(snapshot.data['model']),
                ],
              );
            }
          },
        )
    );
  }
}
