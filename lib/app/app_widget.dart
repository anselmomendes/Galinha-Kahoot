import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      //theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        accentColor: Color.fromARGB(255, 4, 125, 141),
      ),
      //initialRoute: '/teacher_login',
      initialRoute: '/student_menu',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
