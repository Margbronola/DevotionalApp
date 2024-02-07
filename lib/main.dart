import 'package:firebase_core/firebase_core.dart';
import 'package:devotionalapp/devotionalApp.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBLFvj4HpdEgDn0u12SxhO6DQ9K8zGaH_w",
          appId: "1:50097395403:android:086840f64fa23bbdf8ad4e",
          messagingSenderId: "50097395403",
          projectId: "lls-littlelightkids"));
  runApp(const DevotionalApp());
}
