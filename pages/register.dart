import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return
  }
}

class RegisterPageState extends State<RegisterPage> {

  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState>_registerFormKey = GlobalKey<FormState>();
  String? _name;
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _registerButton(),
                _registrationForm(),
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

  Widget _registrationForm() {
    return Container(
      height: _deviceHeight! * 0.30,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameTextField(),
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText:"Name....."),
      onsaved: (_value) {
        setState(() {
          _name = _value;
        }); 
      },
      validator: (_value) => _value!.length > 0 ? null : "Please Enter Your Name",
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

  Widget _registerButton() {
    return MetarialButton(
      onPressed: _registerUser,
      minWidth: _deviceWidth! * 0.50,
      height: _deviceHeight! * 0.05,
      color: Colors.red,
      child: const Text(
        "Register", 
        style: TextStyle(
          color:Color.white,
          fontSize: 25, 
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _registerUser() {
    if(_registerFormKey.currentState!.validate()) {
      _registerFormKey.currentState!.save();
    }
  }
}