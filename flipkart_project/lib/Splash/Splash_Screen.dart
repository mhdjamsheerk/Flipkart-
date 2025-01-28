import 'dart:async';


import 'package:flipkart_project/SignUp&LogIn/Sign_In.dart';
import 'package:flipkart_project/SignUp&LogIn/sign_Up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ct) => SignUp()));
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Image(
            height: 180,
            image: AssetImage(
              "assets/flipkart-logo-transparent-png.png",
            ),
          ),
        ));
  }

  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedin = prefs.getBool("isLoggedin") ?? false;
    if (isLoggedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const SignUp()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const SignIn ()));
    }
  }
}
