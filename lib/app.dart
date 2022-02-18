import 'package:agua_coach_app/modules/presenter/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class WaterApp extends StatelessWidget {
  const WaterApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
