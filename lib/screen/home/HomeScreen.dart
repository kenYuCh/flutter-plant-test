import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_iot_app2/screen/components/appbar/appbar.dart';
import 'package:plant_iot_app2/screen/home/components/body1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: HomeScreenBody1(),
    );
  }
}


// Stateful widget：使用者可以透過點擊或其他互動方式去改變widget內容，例如：Checkbox、Radio、Slider、InkWell、Form、TextField。
// Stateless widget：內容不會變的靜態widget，例如：Icon、IconButton、Text。

/*

*/