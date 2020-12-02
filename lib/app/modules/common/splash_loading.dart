import 'package:flutter/material.dart';

class SplashLoad extends StatefulWidget {
  @override
  _SplashLoadState createState() => _SplashLoadState();
}

class _SplashLoadState extends State<SplashLoad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
