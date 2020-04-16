import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 211, 118, 130), 
                  Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
            ),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack()
        ],
      ),
    );
  }
}
