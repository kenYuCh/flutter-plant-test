import 'package:flutter/material.dart';

class NavigatorDrawer extends StatefulWidget {
  const NavigatorDrawer({Key? key}) : super(key: key);

  @override
  _NavigatorDrawerState createState() => _NavigatorDrawerState();
}

class _NavigatorDrawerState extends State<NavigatorDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
