import 'package:doingbusiness/constants.dart';
import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal(
      {Key? key,
      required this.text,
      required this.obscureText,
      required this.controller,
      this.width = 350,
      this.icon})
      : super(key: key);

  final TextEditingController controller;
  final double width;
  final String text;
  final bool obscureText;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: width,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7,
            )
          ]),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: icon,
          suffixIconColor: primaryColor,
          hintText: text,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
          hintStyle: const TextStyle(height: 1),
        ),
      ),
    );
  }
}
