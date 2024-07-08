import 'package:flutter/material.dart';
import 'package:vr360/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vr 360',
      theme: ThemeData.dark(),
      home: const HomeScreen(title: 'Flutter Panorama'),
      debugShowCheckedModeBanner: false,
    );
  }
}