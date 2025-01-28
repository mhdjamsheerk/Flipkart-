// ignore: file_names

import 'package:flipkart_project/Bottom/Bottom_Bar.dart';
import 'package:flipkart_project/Homepage/Home_Screen.dart';
import 'package:flipkart_project/SignUp&LogIn/Sign_In.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<SignUp> {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm = TextEditingController();
  Future<void> AppSign() async {
    if (fullname.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirm.text.isNotEmpty) {
      if (password.text == confirm.text) {
        final shre = await SharedPreferences.getInstance();
        await shre.setString("fullname", fullname.text);
        await shre.setString('password', password.text);
        await shre.setString('confirm', confirm.text);
        await shre.setString('email', email.text);
        await shre.setBool('isopn', true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => BottomBar()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('mismatch password')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('fill the feild')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Image.asset('assets/flipkart-logo-transparent-png.png',width: 110,)
            ),
          ),
          width: double.infinity, // Full width
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFF0F7BD5),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity, // Full width
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28)),

                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text("Please create your account",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 21,
                            color: const Color(0xFF919191),
                          )),
                      Gap(40),
                      TextFormField(
                        controller: fullname,
                        decoration: InputDecoration(
                            labelText: "Full Name",
                            hintText: "enter name",
                            labelStyle:
                                TextStyle(color: const Color(0XFFA1A1A1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21))),
                      ),
                      Gap(8),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "enter email",
                            labelStyle:
                                TextStyle(color: const Color(0XFFA1A1A1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21))),
                      ),
                      Gap(8),
                      TextFormField(
                        obscureText: true,
                        controller: password,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "enter password",
                            labelStyle:
                                TextStyle(color: const Color(0XFFA1A1A1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21))),
                      ),
                      Gap(8),
                      TextFormField(
                        obscureText: true,
                        controller: confirm,
                        decoration: InputDecoration(
                            labelText: "Confirm Password",
                            hintText: "Confirm Password",
                            labelStyle:
                                TextStyle(color: const Color(0XFFA1A1A1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21))),
                      ),
                      Gap(8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF0F7BD5), // Background color
                          foregroundColor: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          textStyle: TextStyle(fontSize: 16),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          AppSign();
                        },
                        child: Text('Create your account'),
                      ),
                      Gap(40),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 23, 23, 23)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => SignIn()));
                              },
                              child: Text(
                                ' Login',
                                style: TextStyle(
                                    color: const Color(0xFF0F7BD5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
