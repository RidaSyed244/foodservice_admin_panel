import 'package:flutter/material.dart';

bool isDesktop(BuildContext context) {
  return MediaQuery.of(context).size.width >= 600;
}

bool isMobile(BuildContext context) {
  return MediaQuery.of(context).size.width < 600;
}