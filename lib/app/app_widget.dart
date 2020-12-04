import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:load/load.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return LoadingProvider(
          child: child,
        );
      },
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Peensa!',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        accentColor: Color.fromARGB(255, 4, 125, 141),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
