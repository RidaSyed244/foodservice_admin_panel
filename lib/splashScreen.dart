import 'package:flutter/material.dart';
import 'package:the_basics/logIn.dart';

class SplashhScren extends StatefulWidget {
  const SplashhScren({super.key});

  @override
  State<SplashhScren> createState() => _SplashhScrenState();
}

class _SplashhScrenState extends State<SplashhScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 47.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "Welcome to the admin login page. As an administrator, you have access to important tools and features that allow you to manage and control various aspects of this system. Please press this logIn button below to access the logIn page",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                constraints.maxWidth * 0.4,
                                 constraints.maxHeight * 0.1,
                              ),
                              backgroundColor: Color.fromRGBO(238, 167, 52, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LogIn()),
                              );
                            },
                            child: Text(
                              "GET STARTED",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
