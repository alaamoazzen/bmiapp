import 'package:flutter/material.dart';

import '../../../constent/my_colors.dart';

class CostumRichText extends StatelessWidget {
  const CostumRichText({super.key, required this.text1});
final   String text1 ;
  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(style: TextStyle(fontSize: 32), children: [
        TextSpan(
            text: text1,
            style: TextStyle(
                color: MyColors.yellow, )),
        TextSpan(
            text: 'Calculator',
            style: TextStyle(
                color: MyColors.green, fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
