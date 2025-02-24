import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "HOME",
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 32.0,
            letterSpacing: 2.0,
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}