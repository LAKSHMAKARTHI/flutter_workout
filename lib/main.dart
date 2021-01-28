import 'package:flutter/material.dart';
import 'package:grocery/screen/home_screen.dart';
import 'package:grocery/util/constant.dart';

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grocery",
      theme: ThemeData(
        primarySwatch: Constant.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
