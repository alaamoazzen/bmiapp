import 'package:bmi_app_level2/bmi/presentation/pages/bmi_screen.dart';
import 'package:bmi_app_level2/bmi/presentation/widgets/costum_rich_text.dart';
import 'package:bmi_app_level2/constent/my_images.dart';
import 'package:bmi_app_level2/constent/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constent/my_colors.dart';

class BmiDetailsScreen extends StatefulWidget {
  BmiDetailsScreen({super.key, required this.gender});

  final String gender;

  @override
  State<BmiDetailsScreen> createState() => _BmiDetailsScreenState();
}

class _BmiDetailsScreenState extends State<BmiDetailsScreen> {
  int weight = 50;
  double result=0 ;
  int age = 25;
  double height = 160;
  double? lastBmi;
  Color resultColor = MyColors.green1;
String text1='';
String text2='';
  Future<void> getBmi() async {
    final prefs = await SharedPreferences.getInstance();
    double? storedBmi = prefs.getDouble("bmi ");

    setState(() {
      lastBmi = storedBmi;
    });
  }

  void saveBmi(double bmi) async {
    final pref = await SharedPreferences.getInstance();
    pref.setDouble('bmi', bmi);
  }

  Future<void> _clearBmi() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("bmi");

    setState(() {
      lastBmi = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BmiScreen(),));
        }, icon: Icon(Icons.arrow_back_ios_new), color: MyColors.green,),
        title: CostumRichText(text1: 'BMI ',),
        backgroundColor: MyColors.white,
        toolbarHeight: context.screenHeight * 0.15,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Please Modify the values',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(context.screenHeight * 0.03),
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        childAspectRatio: 5 / 6),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: MyColors.pink,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Weight (kg)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyColors.grey1),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48,
                                  color: MyColors.orange),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: context.screenWidth * 0.11,
                                  height: context.screenHeight * 0.055,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 26,
                                      color: MyColors.brown,
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            MyColors.white)),
                                  ),
                                ),
                                SizedBox(
                                    width: context.screenWidth * 0.03
                                ),
                                Container(
                                  width: context.screenWidth * 0.11,
                                  height: context.screenHeight * 0.055,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 26,
                                      color: MyColors.brown,
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            MyColors.white)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: MyColors.pink,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Age',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: MyColors.grey1),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48,
                                  color: MyColors.orange),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: context.screenWidth * 0.11,
                                  height: context.screenHeight * 0.055,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 26,
                                      color: MyColors.brown,
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            MyColors.white)),
                                  ),
                                ),
                                SizedBox(
                                  width: context.screenWidth * 0.03,
                                ),
                                Container(
                                  width: context.screenWidth * 0.11,
                                  height: context.screenHeight * 0.055,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 26,
                                      color: MyColors.brown,
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            MyColors.white)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(right: context.screenHeight * 0.03,
                      left: context.screenHeight * 0.03),
                  child: Container(
                    width: 370,
                    height: 205,
                    decoration: BoxDecoration(
                        color: MyColors.pink,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Height (cm)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: MyColors.grey1),
                        ),
                        Text(
                          '${height.toInt()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: MyColors.orange),
                        ),
                        Slider(
                          inactiveColor: MyColors.grey,
                          activeColor: MyColors.orange,
                          thumbColor: MyColors.orange,
                          value: height,
                          onChanged: (val) {
                            setState(() {
                              height = val;
                            });
                          },
                          max: 200,
                          min: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: context.screenWidth * 0.8,
                  height: context.screenHeight * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                       result = getResult(height, weight);
                      saveBmi(result);
getInfo(result);
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              backgroundColor: MyColors.blue,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Your BMI:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text((result.toStringAsFixed(2)),
                                      style: TextStyle(
                                          fontSize: 64,
                                          fontWeight: FontWeight.bold,
                                          color: changeColor(result))),
                                  Image.asset(MyImages.bmiBar),
                                  SizedBox(
                                    height: context.screenHeight * 0.015,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      buildColumn('${weight} Kg', 'Weight'),
                                      buildColumn(
                                          '${height.toInt()} cm', 'Height'),
                                      buildColumn('${age}', 'Age'),
                                      buildColumn('${widget.gender}', 'Gender'),
                                    ],),
                                  SizedBox(height: context.screenHeight*0.02,),
                                  RichText(textAlign: TextAlign.center,text: TextSpan(children: [
                                    TextSpan(text: text1,style: TextStyle(color: MyColors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                                    TextSpan(text: text2,style: TextStyle(color: changeColor(result))),
                                  ]))
                                ],
                              ),
                              actions: [
                                SizedBox(width: context.screenWidth * 0.8,
                                  height: context.screenHeight * 0.07,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Close',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: MyColors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:changeColor(result)),
                                  ),
                                )
                              ],
                            ),
                      );
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: MyColors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.green),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColumn(String text1, String text2) {
    return Column(children: [
      Text(text1, style: TextStyle(color: changeColor(result), fontSize: 20,fontWeight: FontWeight.bold),),
      Text(text2, style: TextStyle(fontSize: 14, color: MyColors.grey1))
    ],);
  }

  double getResult(double h, int w) {
    double result1 = (w) / (h * h * 0.0001);
    saveBmi(result1);

    return result1;
  }

  void getInfo(double x) {
    print(x);
    if (x < 18.5) {

   setState(() {
     text1='You are underweight\n';
     text2='bmi<18.5';
   });

    }
    else if (x >= 18.5 && x < 24.9) {
      text1='You have a healthy weight\n';
      text2='bmi>18.5 && bmi<24.9';

    }
    else if (x >= 25 && x < 29.9) {
      text1='You are slightly overweight\n';
      text2 = 'bmi>25 && bmi<29.9';

    }
    else

    {
    text1 = 'you are severely obese\n';
    text2 = 'bmi>=30 && bmi<40';

    }
  }

  Color changeColor(double x) {
    if (x < 18.5) {
      resultColor = MyColors.blueResult;

      return resultColor;
    }
    else if (x >= 18.5 && x < 24.9) {
      resultColor = MyColors.green1;
      return resultColor;
    }
    else if (x >= 25 && x < 29.9) {
      resultColor = MyColors.yellowResult;
      return resultColor;
    }
    else
      (x >= 30 && x < 40);
    {
      resultColor = MyColors.redResult;
      return resultColor;
    }
  }

}
