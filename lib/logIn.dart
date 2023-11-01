import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_basics/emailField.dart';
import 'package:the_basics/forgotPassword.dart';
import 'package:the_basics/users.dart';
import 'StateManagement.dart';
import 'dashboard.dart';

class LogIn extends ConsumerStatefulWidget {
  const LogIn({super.key});

  @override
  ConsumerState<LogIn> createState() => _LogInState();
}

class _LogInState extends ConsumerState<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Log In",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Text('Log In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 47.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                      "As an authorized administrator, you hold the keys to unlocking the full potential of our system. With a wide range of powerful tools and features at your fingertips, you have the ability to shape and manage the system's functionality.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      )),
                  SizedBox(
                    height: 30.0,
                  ),
                  EmailField(),
                  SizedBox(
                    height: 25.0,
                  ),
                  PasswrdField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  frgotButton(),
                  SizedBox(
                    height: 30.0,
                  ),
                  SocialButton(
                    label: "Log In",
                    horizontalPadding: 40,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
