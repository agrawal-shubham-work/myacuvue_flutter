import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/routes/static_routes.dart';
import 'package:my_acuvue_flutter/screens/home.dart';
import 'package:my_acuvue_flutter/screens/splash_screen.dart';
import 'package:my_acuvue_flutter/screens/trial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: StaticRoutes.splash,
      routes: {
        StaticRoutes.splash: (context) => SplashScreen(),
        StaticRoutes.home: (context) => Home(),
      },
    );
  }
}
