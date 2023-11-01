import 'package:flutter/material.dart';

class DrivingLicenseImage extends StatefulWidget {
  const DrivingLicenseImage({super.key, required this.drivingLicenseImages});
  final String? drivingLicenseImages;
  @override
  State<DrivingLicenseImage> createState() => _DrivingLicenseImageState();
}

class _DrivingLicenseImageState extends State<DrivingLicenseImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Image.network(
          widget.drivingLicenseImages.toString(),
          fit: BoxFit.cover,
        )));
  }
}
