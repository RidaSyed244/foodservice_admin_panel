import 'package:flutter/material.dart';

class IDCardImage extends StatefulWidget {
  const IDCardImage({super.key, required this.idCardImage});
  final String? idCardImage;
  @override
  State<IDCardImage> createState() => _IDCardImageState();
}

class _IDCardImageState extends State<IDCardImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Image.network(
          widget.idCardImage!,
          fit: BoxFit.cover,
        )));
  }
}
