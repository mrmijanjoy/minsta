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
      initialRoute: 'login',
      routes: {
        'register': (context) => RegisterPage(),
        'login': (context) => LoginPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Boilerplate'),
      ),
      body: Center(
        child: Text(
          'Welcome to Flutter!',
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
