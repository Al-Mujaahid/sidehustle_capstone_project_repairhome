// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sidehustle_capstone/screens/home_page.dart';
import 'package:sidehustle_capstone/screens/signin.dart';
import 'package:sidehustle_capstone/utils/colors.dart';
import 'package:sidehustle_capstone/utils/constants.dart';
import 'package:sidehustle_capstone/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: liteWhite,
      body: SideSpace(
        20,
        10,
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const YSpace(30),
              SizedBox(
                width: 130,
                height: 130,
                child: Image.asset(logo_2),
              ),
              const YSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextOf('Create new account', 17, FontWeight.bold, black)
                ],
              ),
              const YSpace(10),
              TextInput(hint: 'Email'),
              const YSpace(20),
              TextInput(hint: 'Password'),
              const YSpace(20),
              TextInput(hint: 'Confirm password'),
              const YSpace(20),
              Button(
                  action: () {
                    goto(context, const HomePage());
                  },
                  text: 'Sign up'),
              const YSpace(20),
              TextOf('• Or sign up with -', 15, FontWeight.w500, ash),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageCard(path: google),
                  ImageCard(path: facebook),
                  ImageCard(path: twitter),
                ],
              ),
              const YSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextOf(
                      "• Already have an account? ", 15, FontWeight.w500, ash),
                  InkWell(
                    child: TextOf(" Sign in", 15, FontWeight.w500, blue),
                    onTap: () {
                      goto(context, const SignInScreen());
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  ImageCard({
    required this.path,
    Key? key,
  }) : super(key: key);
  String path;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 90,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          path,
        ),
      ),
    );
  }
}
