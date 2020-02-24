import 'package:flutter/material.dart';
import 'package:new_app/screens/taskScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Krona One'),
      home: TaskScreen(),
    );
  }
}
