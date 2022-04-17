import 'package:flutter/material.dart';
import 'package:plant_iot_app2/screen/device/components/deviceBody.dart';

class Devices extends StatelessWidget {
  const Devices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DeviceBody(),
    );
  }
}
