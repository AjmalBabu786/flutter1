import 'package:flutter/material.dart';
import 'package:sample/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'login.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    checkinglog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/whatsapp-icon.png',
          width: 110,
        ),
      ),
    );
  }

  Future<void> loginpage() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => login(),
      ),
    );
  }

  Future<void> checkinglog() async {
    final _sharedpre = await SharedPreferences.getInstance();
    final _userlog = _sharedpre.getBool(save_key_name);
    if (_userlog == null || _userlog == false) {
      loginpage();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => myhome()));
    }
  }
}
