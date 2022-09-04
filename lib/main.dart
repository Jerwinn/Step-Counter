import 'package:flutter/material.dart';
import 'package:dissertation_project/homePage.dart';
///Class used to launch the app.
void main() => runApp(
  const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    title: "Pedometer App"
  ),
);

