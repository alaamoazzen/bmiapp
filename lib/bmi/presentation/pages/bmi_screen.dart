import 'package:bmi_app_level2/bmi/presentation/pages/bmi_details_screen.dart';
import 'package:bmi_app_level2/constent/my_colors.dart';
import 'package:bmi_app_level2/constent/my_images.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(style: TextStyle(fontSize: 32), children: [
            TextSpan(
                text: 'BMI ',
                style: TextStyle(
                    color: MyColors.yellow, fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Calculator',
                style: TextStyle(
                    color: MyColors.green, fontWeight: FontWeight.bold)),
          ]),
        ),
        backgroundColor: MyColors.white,
        toolbarHeight: 100,
        centerTitle: true,
      ),
      backgroundColor: MyColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Please choose your gender',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Container(
                  width: 370,
                  height: 180,
                  decoration: BoxDecoration(
                      color: MyColors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Male',
                        style: TextStyle(
                          color: MyColors.green1,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Image.asset(MyImages.frame1),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Image.asset(MyImages.icon1),
                  top: 20,
                  right: 110,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20,top: 10),
            child: Stack(
              children: [
                Container(
                  width: 370,
                  height: 180,
                  decoration: BoxDecoration(
                      color: MyColors.pink,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Female',
                          style: TextStyle(
                            color: MyColors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Image.asset(MyImages.frame2),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Image.asset(MyImages.icon2),
                  top: 20,
                  right: 110,
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
          SizedBox(width: 290,height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BmiDetailsScreen(),));
                },
                child: Text(
                  'Continue',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: MyColors.white),
                ),style: ElevatedButton.styleFrom(backgroundColor: MyColors.green),
            ),
          )
        ],
      ),
    );
  }
}
