import 'package:absensi/Constant/constant.dart';
import 'package:absensi/Launcher/launcher.dart';
import 'package:absensi/Login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Launcher(),
      routes: <String, WidgetBuilder>{
        Splash_Screen: (BuildContext context) => const Launcher(),
        Home_Screen: (BuildContext context) => const Login(),
      }
    );
  }
}
