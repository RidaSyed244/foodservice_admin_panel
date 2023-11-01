import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_basics/users.dart';

import 'StateManagement.dart';
import 'dashboard.dart';
import 'forgotPassword.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
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
            )),
      ),
    );
  }
}

class PasswrdField extends StatefulWidget {
  const PasswrdField({super.key});

  @override
  State<PasswrdField> createState() => _PasswrdFieldState();
}

class _PasswrdFieldState extends State<PasswrdField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: TextField(
        controller: passwordController,
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

class frgotButton extends StatefulWidget {
  const frgotButton({super.key});

  @override
  State<frgotButton> createState() => _frgotButtonState();
}

class _frgotButtonState extends State<frgotButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
            color: Colors.black,
            child: Text('Forgot Password?',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  textBaseline: TextBaseline.ideographic,
                )),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()));
            })
      ],
    );
  }
}

class SocialButton extends ConsumerStatefulWidget {
  final String label;
  final double horizontalPadding;
  const SocialButton({
    Key? key,
    required this.label,
    this.horizontalPadding = 40,
  }) : super(key: key);

  @override
  ConsumerState<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends ConsumerState<SocialButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        // await ref.read(logIn.notifier).registerUser();
        final logInn = await ref.read(logIn.notifier).login();
        await ref.read(logIn.notifier).setAdminData();
        if (logInn != false) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("email", emailController.text);
        }
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      },
      icon: Icon(
        Icons.login,
        color: Colors.white,
      ),
      label: Text(
        widget.label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: widget.horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
