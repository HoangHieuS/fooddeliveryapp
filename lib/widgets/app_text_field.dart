import 'package:flutter/material.dart';
import 'package:food_delivery/utils/utils.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final Color iconColor;
  bool isObscure;
  AppTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.iconColor = const Color(0xFF89dad0),
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(1, 1),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: TextField(
        obscureText: isObscure ? true : false,
        controller: textController,
        decoration: InputDecoration(
          //hintText
          hintText: hintText,
          //prefixIcon
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          //focusedBorder
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          //enabledBorder
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          //border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
          ),
        ),
      ),
    );
  }
}
