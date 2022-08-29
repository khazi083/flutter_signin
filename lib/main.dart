

import 'package:flutter/material.dart';
import 'package:sign_in_flutter/first_screen.dart';
import 'package:sign_in_flutter/sign_in.dart';

import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          (uid != null && authSignedIn != false) ? FirstScreen() : LoginPage(),
    );
  }
}
