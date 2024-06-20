import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {

  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Safearea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: _deviceWidth! * 0.05,
            ),
            child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                mainAxisSize: MainAxisSize.max, 
                crossAxisAlignment: crossAxisAlignment.Center,
                children: [
                  _titleWidget(),
                  _loginButton(),
                ],
            ),
          ),
        ), 
      ),
    );
  }

  Widget _titleWidget() {
    return const Text("Mista", 
      style:TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _loginButton() {
    return MetarialButton(
      onPressed: () {},
      minWidth: _deviceWidth! * 0.70,
      height: _deviceHeight! * 0.06,
      color: Colors.red,
      child: const Text(
        "Login", 
        style: TextStyle(
          color:Color.white,
          fontSize: 25, 
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}