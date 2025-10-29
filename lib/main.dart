import 'package:flutter/material.dart';
import 'package:live_test/view/home.dart';
import 'package:live_test/view/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          // Home(data: {"": ''})
          Login(),
    );
  }
}
