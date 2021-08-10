import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double width;
  final double height;

  const CustomAvatar({this.width = 60, this.height = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/avatar.png'),
          )),
    );
  }
}
