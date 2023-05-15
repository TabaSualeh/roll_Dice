// ignore_for_file: prefer_const_constructors

import 'package:dice_roll/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homePage(),
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red.shade400,
        ));
  }
}
