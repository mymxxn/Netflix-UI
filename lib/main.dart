import 'package:flutter/material.dart';
import 'package:netflix/bottomnavigation.dart';
import 'package:netflix/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: backgroundcolor,
          textTheme: const TextTheme(
            // bodyText1: TextStyle(color: Colors.white),
            // bodyText2: TextStyle(color: Colors.white),
          )),
      home: const BottomNav(),
    );
  }
}
