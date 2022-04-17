import 'package:flutter/material.dart';
import 'package:plant_iot_app2/screen/components/routeBottomBar/MainBottomBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        highlightColor: Color.fromARGB(255, 0, 0, 0),
        splashColor: Color.fromARGB(255, 0, 0, 0),
        scrollbarTheme: ScrollbarThemeData(
          thickness: MaterialStateProperty.all(5.0),
          minThumbLength: 100,
        ),
      ),
      home: const SafeArea(
        // top: true,
        // bottom: false,
        child: RouteBottomBar(),
      ),
    );
  }
}
