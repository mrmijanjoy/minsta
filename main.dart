import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minsta',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      routes: {
        'register': (context) => RegisterPage(),
        'login': (context) => LoginPage(),
        'home': (context) => HomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minsta'),
      ),
      body: Center(
        child: Text(
          'Welcome to Minsta!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}



























































// import 'dart:async';

// import 'package:boilerplate/di/service_locator.dart';
// import 'package:boilerplate/presentation/my_app.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await setPreferredOrientations();
//   await ServiceLocator.configureDependencies();
//   runApp(MyApp());
// }

// Future<void> setPreferredOrientations() {
//   return SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//     DeviceOrientation.landscapeRight,
//     DeviceOrientation.landscapeLeft,
//   ]);
// }
