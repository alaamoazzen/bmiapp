import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.colorText});
final  String text ;
final Color colorText ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle( color: colorText),
    );
  }
}
