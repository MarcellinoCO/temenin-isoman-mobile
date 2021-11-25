import 'package:flutter/material.dart';
import './screens/login_screen.dart';
import './screens/wilayah_screen.dart';

void main() {
  runApp(TemeninIsomanApp());
}

class TemeninIsomanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginScreen(),
        "/wilayah": (context) => WilayahScreen()
      },
    );
  }
}
