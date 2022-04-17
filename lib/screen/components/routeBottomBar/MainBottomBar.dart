import 'package:flutter/material.dart';
import 'package:plant_iot_app2/screen/components/appbar/appbar.dart';
import 'package:plant_iot_app2/screen/components/drawerBar/navigatorDrawer.dart';
import 'package:plant_iot_app2/screen/device/devices.dart';
import 'package:plant_iot_app2/screen/home/HomeScreen.dart';
import 'package:plant_iot_app2/screen/login/login.dart';
import 'package:plant_iot_app2/screen/people/people.dart';
import 'package:plant_iot_app2/screen/setting/setting.dart';

class RouteBottomBar extends StatefulWidget {
  const RouteBottomBar({Key? key}) : super(key: key);
  @override
  _BottomBarBodyState createState() => _BottomBarBodyState();
}

class _BottomBarBodyState extends State<RouteBottomBar> {
  int _index = 0;
  final pages = const [
    HomeScreen(),
    Devices(),
    People(),
    People(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigatorDrawer(),
      appBar: buildAppBar(context),
      body: pages[_index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(48, 255, 255, 255),
            backgroundColor: Colors.amber,
            iconTheme: MaterialStateProperty.all(
              IconThemeData(color: Colors.white, size: 24.0),
            ),
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white))),
        child: NavigationBar(
          height: 65.0,
          backgroundColor: Colors.black,
          selectedIndex: _index,
          onDestinationSelected: _onItemTapped,
          destinations: const <NavigationDestination>[
            NavigationDestination(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            NavigationDestination(
              icon: Icon(
                Icons.devices,
              ),
              label: "Devices",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.add,
              ),
              label: "Add",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.people,
              ),
              label: "People",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings,
              ),
              label: "Setting",
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
