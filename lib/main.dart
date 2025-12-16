import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/screens/log_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main page',
      // theme: ThemeData(useMaterial3: false),
      home: LogIn(),
    );
  }
}
