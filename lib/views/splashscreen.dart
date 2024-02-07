import 'package:devotionalapp/views/devotional.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Future<void> _checker() async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DevotionalPage()),
    );
  }

  @override
  void initState() {
    _checker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height * .55,
                color: Colors.white,
                width: size.width,
              ),
              Container(
                height: size.height * .45,
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 83, 48, 144),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                      MediaQuery.of(context).size.width,
                      80,
                    ),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: size.height * .17),
                Image.asset(
                  "assets/images/LLSKids_Devotion_2_1.png",
                  fit: BoxFit.cover,
                  width: 300,
                  height: 320,
                ),
                const SizedBox(height: 20),
                const Text(
                  "A daily devotional\nfor kids",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 252, 218, 70),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
