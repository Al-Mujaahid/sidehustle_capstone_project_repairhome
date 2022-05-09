import 'package:flutter/material.dart';
import 'package:sidehustle_capstone/screens/signin.dart';
import 'package:sidehustle_capstone/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void nextPageCaller() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    nextPageCaller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 130,
                height: 130,
                child: Image.asset('assets/images/logo_1.png'),
              ),
            ),
          ]),
    );
  }
}
