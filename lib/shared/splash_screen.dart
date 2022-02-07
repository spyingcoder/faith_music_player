import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () => Navigator.pushNamed(context, '/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height) - 100,
                left: (MediaQuery.of(context).size.width * 0.25)),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'More than a Music Player',
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.red[200],
                  ),
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
        ],
      ),
    );
  }
}
