import 'package:flutter/material.dart';
import 'package:url_launcher_demo/demo_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black54,
        appBarTheme: const AppBarTheme(
          color: Colors.blueGrey
        ),
      ),
      home: const DemoScreen(),
    );
  }
}
