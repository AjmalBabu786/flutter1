import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myhome extends StatelessWidget {
  const myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  // signout(context);
                  showSignoutdialog(context);
                },
                icon: const Icon(Icons.exit_to_app)),
          ],
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text(
            'Home',
          )),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, intex) {
              return ListTile(
                title: Text('person$intex'),
                subtitle: const Text('message'),
                leading: (intex % 2 == 0)
                    ? const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/whatsapp pro1.webp'),
                      )
                    : Image.asset('assets/whatsapp pro.webp'),
                trailing: Text('1$intex:05'),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
              );
            },
            itemCount: 10),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedpre = await SharedPreferences.getInstance();
    await _sharedpre.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => login()), (route) => false);
  }

  showSignoutdialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('sign out'),
            content: Text('do you want to exit the app'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text('cancel'),
              ),
              TextButton(
                onPressed: () {
                  signout(ctx);
                },
                child: Text('ok'),
              ),
            ],
          );
        });
  }
}
