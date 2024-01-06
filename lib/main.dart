import 'package:flutter/material.dart';
import 'package:integrity/components/navbar.dart';
import 'package:integrity/components/side_menu.dart';
import 'package:integrity/entry_point.dart';
import 'package:integrity/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EntryPoint(),
    );
  }
}

