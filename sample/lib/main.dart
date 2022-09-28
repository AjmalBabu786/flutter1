import 'package:flutter/material.dart';
import 'package:sample/screen/splash.dart';

const save_key_name = 'userlog';

void main() {
  runApp(
    myApp(),
  );
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
