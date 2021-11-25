import 'package:flutter/material.dart';
import './login_screen.dart';

void main() {
  runApp(TemeninIsomanApp());
}

class TemeninIsomanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
