import 'package:flutgram/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'screens/home_screen.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(FlutgramApp());
}

class FlutgramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutgram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: blackColor,
      ),
      home: HomePage(),
    );
  }
}
