import 'package:flutter/material.dart';
import 'package:tapshyrma_8_bmi/for.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}
