import 'package:flutter/material.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  _LoginScreenBodyState createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Login"),
    );
  }
}
