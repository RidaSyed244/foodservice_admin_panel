// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:the_basics/dashboard.dart';
import 'package:the_basics/forgotPassword.dart';
import 'package:the_basics/logIn.dart';
import 'package:the_basics/splashScreen.dart';

import 'allDrivers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBWTGPVFck2aMelTe3NfNMvdXR4wV189kE",
          authDomain: "food-service-a1b57.firebaseapp.com",
          projectId: "food-service-a1b57",
          storageBucket: "food-service-a1b57.appspot.com",
          messagingSenderId: "470233009749",
          appId: "1:470233009749:web:197c5bbf2ccc06ba370edc",
          measurementId: "G-02NHBXTHKD"));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setBool('isLoggedIn', true);
  var adminEmail = prefs.getString('email');
  runApp(ProviderScope(
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home:
     adminEmail == null ? SplashhScren() :
     Dashboard(),
  )));
}
