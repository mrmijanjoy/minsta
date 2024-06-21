import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {

  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState>_loginFormKey = GlobalKey<FormState>();
  String? _email;
  String? _password; 

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
                crossAxisAlignment: CrossAxisAlignment.Center,
                children: [
                  _titleWidget(),
                  _loginButton(),
                  _loginButton(),
                  _registerPageLink(),
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

  Widget _loginForm() {
    return Container(
      height: _deviceHeight! * 0.20,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.Center,
          children: [
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText:"Email....."),
      onsaved: (_value) {
        setState(() {
          _email = _value;
        }); 
      },
      validator: (_value) {
        bool _result = _value!.contains(
          RegExp(
            r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"
          ),
        );
        return _result ? null : "Please enter a valid email";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText:"Password....."),
      onsaved: (_value) {
        setState(() {
          _password = _value;
        }); 
      },
      validator: (_value) => _value!.length > 6 
        ? null 
        : "Please enter a password greater than six character",
    );
  }

  Widget _loginButton() {
    return MetarialButton(
      onPressed: _loginUser,
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

  Widget _registerPageLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'register'),
      child: const Text("Don't have an account", style: TextStyle(
          color: Colors.blue,
          fontSize: 15,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }

  void _loginUser() {
    // print(_loginFormKey.currentState!.validate());
    if(_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
    }
  }
}