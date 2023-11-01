import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_basics/logIn.dart';
import 'package:the_basics/users.dart';
import 'StateManagement.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key});

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Forgot Password",
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
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 47.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  "Can't remember your password? Don't fret!\nWe'll guide you through the password recovery process.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                EnterEmail(),
                SizedBox(
                  height: 25.0,
                ),
                EnterPassword(),
                SizedBox(
                  height: 35.0,
                ),
                ResetPassword(ref: ref),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
      child: MaterialButton(
        onPressed: () async {
          await ref.read(logIn.notifier).updateNewPassword();
        
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogIn()),
          );
        },
        minWidth: 180.0,
        height: 50.0,
        child: Text(
          'Reset Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class EnterPassword extends StatelessWidget {
  const EnterPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: TextField(
        controller: passwordController,
        obscureText: true,
        onChanged: (value) {},
        style: TextStyle(
          color: Colors.grey,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          hintText: 'Enter your password',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
        ),
      ),
    );
  }
}

class EnterEmail extends ConsumerStatefulWidget {
  const EnterEmail({
    super.key,
  });

  @override
  ConsumerState<EnterEmail> createState() => _EnterEmailState();
}

class _EnterEmailState extends ConsumerState<EnterEmail> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: TextField(
        controller: emailController,
        onChanged: (value) {},
        style: TextStyle(
          color: Colors.grey,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.grey,
          ),
          hintText: 'Enter your email',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
        ),
      ),
    );
  }
}

