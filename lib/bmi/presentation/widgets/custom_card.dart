import 'package:flutter/material.dart';

import '../../../constent/my_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.onTap, required this.borderColor, required this.containerColor, required this.textColor, required this.icon, required this.image});
 final void Function() onTap ;
 final Color borderColor;
 final Color containerColor ;
 final Color textColor;
 final String icon ;
 final String image;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        InkWell(
          onTap:  onTap,

          child: Container(
            width: 370,
            height: 180,
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                color: containerColor,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Female',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(image),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: Image.asset(icon),
          top: 20,
          right: 110,
        ),
      ],
    );
  }
}
