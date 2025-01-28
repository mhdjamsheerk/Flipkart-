import 'package:flipkart_project/Bottom/Bottom_Bar.dart';
import 'package:flipkart_project/Homepage/Home_Screen.dart';
import 'package:flipkart_project/SignUp&LogIn/sign_Up.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  Future<void> Loginpage() async {
    SharedPreferences sher = await SharedPreferences.getInstance();
    String? value = sher.getString('email');
    String? value1 = sher.getString('password');
    if (value == email.text && value1 == password.text) {
      await sher.setBool('isLog', true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => BottomBar()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("try again")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Align(
                alignment: Alignment.topCenter,
                // child: Icon(
                //   // Icons.shopify,
                //   size: 100,
                //   color: const Color(0xffF9E601),
                // )
                child: Image.asset('assets/flipkart-logo-transparent-png.png',width: 110,),
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: const Color(0xFF0F7BD5),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28)),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Please Login to Continue',
                        style: TextStyle(
                            color: const Color(0xFF919191), fontSize: 20),
                      ),
                      Gap(40),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "enter your email",
                            labelStyle:
                                TextStyle(color: const Color(0XFFA1A1A1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21))),
                      ),
                      Gap(20),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "enter your password",
                            labelStyle:
                                TextStyle(color: const Color(0XFFA1A1A1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21))),
                      ),
                      Gap(20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F7BD5),
                          foregroundColor: (Colors.white),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          Loginpage();
                        },
                        child: Text('Login'),
                      ),
                      Gap(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 23, 23, 23),
                                fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => SignUp()));
                            },
                            child: Text(
                              'Create New',
                              style: TextStyle(
                                  color: const Color(0xFF0F7BD5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
