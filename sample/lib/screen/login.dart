import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _user = "user";
  final _pass = "1234";
  final _usernamecontroler = TextEditingController();

  final _passwordcontroler = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      //   title: Text('login page'),
      //   backgroundColor: Color.fromARGB(255, 10, 156, 15),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 400,
                    image: AssetImage('assets/whatsapp name.png'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      controller: _usernamecontroler,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'UserName',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'username is empty';
                        } else if (_user != value) {
                          return 'username is incurrect';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _passwordcontroler,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is empty';
                        } else if (_pass != value) {
                          return 'Password is incurrect';
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        checklogin(context);
                      } else {}
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext context) async {
    final _username = _usernamecontroler.text;
    final _password = _passwordcontroler.text;
    if (_username == _user && _password == _pass) {
      print('success');
      final _sharedpre = await SharedPreferences.getInstance();
      await _sharedpre.setBool(save_key_name, true);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) => myhome())));
    }
  }
}
