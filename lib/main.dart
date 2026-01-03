import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/screens/log_in.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Main page',
        // theme: ThemeData(useMaterial3: false),
        home: const LogIn(),
      );
  }
}
