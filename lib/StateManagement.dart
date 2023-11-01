// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class AllDriverss {
  final String? CNIC_No;
  final String? Driver_Phone;
  final String? Driver_email;
  final String? Driver_name;
  final String? DrivingLicenseImageUrl;
  final String? IDCardImageUrl;
  final String? driverStatus;

  AllDriverss({
    this.CNIC_No,
    this.Driver_Phone,
    this.Driver_email,
    this.Driver_name,
    this.DrivingLicenseImageUrl,
    this.driverStatus,
    this.IDCardImageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CNIC_No': CNIC_No,
      'Driver_Phone': Driver_Phone,
      'Driver_email': Driver_email,
      'Driver_name': Driver_name,
      'DrivingLicenseImageUrl': DrivingLicenseImageUrl,
      'IDCardImageUrl': IDCardImageUrl,
      'driverStatus': driverStatus,
    };
  }

  factory AllDriverss.fromMap(Map<String, dynamic> map) {
    return AllDriverss(
      CNIC_No: map['CNIC_No'] != null ? map['CNIC_No'] as String : null,
      Driver_Phone: map['Driver_Phone'] != null ? map['Driver_Phone'] as String : null,
      Driver_email: map['Driver_email'] != null ? map['Driver_email'] as String : null,
      Driver_name: map['Driver_name'] != null ? map['Driver_name'] as String : null,
      DrivingLicenseImageUrl: map['DrivingLicenseImageUrl'] != null ? map['DrivingLicenseImageUrl'] as String : null,
      IDCardImageUrl: map['IDCardImageUrl'] != null ? map['IDCardImageUrl'] as String : null,
      driverStatus: map['driverStatus'] != null ? map['driverStatus'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllDriverss.fromJson(String source) => AllDriverss.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Admin {
  final String? email;
  final String restraunt_logo;
  final String? restaurant_name;
  final String? restaurant_address;
  final String? restraunt_currency;
  final String? status;

  Admin({
    this.email,
    required this.restraunt_logo,
    this.restaurant_name,
    this.restaurant_address,
    this.restraunt_currency,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'restraunt_logo': restraunt_logo,
      'restaurant_name': restaurant_name,
      'restaurant_address': restaurant_address,
      'restraunt_currency': restraunt_currency,
      'status': status,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      email: map['email'] != null ? map['email'] as String : null,
      restraunt_logo: map['restraunt_logo'] as String,
      restaurant_name: map['restaurant_name'] != null
          ? map['restaurant_name'] as String
          : null,
      restaurant_address: map['restaurant_address'] != null
          ? map['restaurant_address'] as String
          : null,
      restraunt_currency: map['restraunt_currency'] != null
          ? map['restraunt_currency'] as String
          : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) =>
      Admin.fromMap(json.decode(source) as Map<String, dynamic>);
}

class testBoxDelete extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }
}

class LoGIn extends StateNotifier {
  LoGIn() : super('');
  //  Future createUser() async {
  //   UserCredential result = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //           email: emailController.text, password: passwordController.text);
  //   User? user = result.user;
  //   return user;
  // }

  // Future registerUser() async {
  //   return FirebaseFirestore.instance
  //       .collection("Admin")
  //       .doc(FirebaseAuth.instance.currentUser?.uid)
  //       .set({

  //     "AdminEmail": emailController.text,

  //     "AdminPassword": passwordController.text,
  //   });
  // }

  Future login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // User is logged in, you can access userCredential.user for the user's data
      print('User logged in: ${userCredential.user?.email}');

      // Update UI or navigate to home page
    } on FirebaseAuthException catch (e) {
      // Login failed, handle the error
      if (e.code == 'user-not-found') {
        print('No user found for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user');
      } else {
        print('Error logging in: $e');
      }
    } catch (e) {
      print('Error logging in: $e');
    }
  }
setAdminData(){
  FirebaseFirestore.instance.collection("Admin")
  .doc(FirebaseAuth.instance.currentUser?.uid).set({
    "AdminEmail": emailController.text,
    "AdminPassword": passwordController.text,
  
  });
}
  Future updateNewPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text);
  }

  Future signout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    return await FirebaseAuth.instance.signOut();
  }
}
