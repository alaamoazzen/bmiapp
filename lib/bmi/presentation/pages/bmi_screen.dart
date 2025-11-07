import 'package:bmi_app_level2/bmi/presentation/pages/bmi_details_screen.dart';
import 'package:bmi_app_level2/bmi/presentation/widgets/costum_rich_text.dart';
import 'package:bmi_app_level2/bmi/presentation/widgets/costum_text.dart';
import 'package:bmi_app_level2/bmi/presentation/widgets/custom_card.dart';
import 'package:bmi_app_level2/constent/my_colors.dart';
import 'package:bmi_app_level2/constent/my_images.dart';
import 'package:bmi_app_level2/constent/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BmiScreen extends StatefulWidget {
  BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double? lastBmi;

  Color containerColorM = MyColors.blue;
  Color containerColorF = MyColors.pink;

  String gender = '';

  Future<void> getBmi() async {
    final prefs = await SharedPreferences.getInstance();
    double? storedBmi = prefs.getDouble("bmi");

    setState(() {
      lastBmi = storedBmi;
    });
  }
@override
  void initState() {
    // TODO: implement initState
    getBmi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CostumRichText(text1: 'BMI '),
        backgroundColor: MyColors.white,
        toolbarHeight: context.screenHeight*0.15,
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
          lastBmi!=null? Text('${lastBmi}'):SizedBox(),

          Padding(
            padding: EdgeInsets.all(context.screenHeight*0.03),
            child: CustomCard(
              onTap: () {
                setState(() {
                  if(containerColorM==MyColors.blue)
                    {
                      containerColorM=MyColors.green;
                      containerColorF= MyColors.pink;
                    }
                });
              },
              borderColor: containerColorM,
              containerColor: MyColors.blue,
              textColor: MyColors.green1,
              icon: MyImages.icon1,
              image: MyImages.frame1,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(right: context.screenHeight*0.03, left: context.screenHeight*0.03, top: context.screenHeight*0.01),
            child: CustomCard(
              onTap: () {
                setState(() {
                  if(containerColorF==MyColors.pink)
                  {
                    containerColorF=MyColors.orange;
                    containerColorM= MyColors.blue;
                  }
                });
              },
              borderColor: containerColorF,
              containerColor: MyColors.pink,
              textColor: MyColors.orange,
              icon: MyImages.icon2,
              image: MyImages.frame2,
            ),
          ),
          SizedBox(height: context.screenHeight*0.07),
          SizedBox(
            width: context.screenWidth*0.8,
            height: context.screenHeight*0.07,
            child: ElevatedButton(
              onPressed: () {
                if (containerColorM == MyColors.green) {
                  gender = 'Male';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BmiDetailsScreen(gender: gender);
                      },
                    ),
                  );
                } else if (containerColorF == MyColors.orange) {
                  gender = 'Famale';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BmiDetailsScreen(gender: gender);
                      },
                    ),
                  );
                } else if (containerColorM != MyColors.green &&
                    containerColorF != MyColors.orange) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: MyColors.orange,
                      content: Text(
                        'Opps.. please select gender',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: MyColors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: MyColors.green),
            ),
          ),
        ],
      ),
    );
  }
}



