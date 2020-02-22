import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:votesmarter/screen/home_screen.dart';
import 'package:votesmarter/screen/test_game_screen.dart';
import 'package:votesmarter/screen/test_game_screen_v.dart';
import 'package:votesmarter/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: HomeScreen(),
    );
  }
}
