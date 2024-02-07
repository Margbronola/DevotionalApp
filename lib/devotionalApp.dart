// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'views/splashscreen.dart';

class DevotionalApp extends StatefulWidget {
  const DevotionalApp({super.key});

  @override
  State<DevotionalApp> createState() => _DevotionalAppState();
}

class _DevotionalAppState extends State<DevotionalApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Club Devotions',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
