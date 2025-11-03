import 'package:bmi_app_level2/constent/my_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

import '../../../constent/my_colors.dart';

class BmiDetailsScreen extends StatefulWidget {
  BmiDetailsScreen({super.key});

  @override
  State<BmiDetailsScreen> createState() => _BmiDetailsScreenState();
}

class _BmiDetailsScreenState extends State<BmiDetailsScreen> {
  int weight = 50;
  int age = 25;
  double height = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new,color: MyColors.green ,),
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
                  padding: const EdgeInsets.all(12.0),
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
                                  width: 40,
                                  height: 40,
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
                                  width: 10,
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
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
                                  width: 40,
                                  height: 40,
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
                                  width: 10,
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
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
                  width: 290,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: MyColors.blue,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Your BMI:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(('${getResult(height, weight)}'),
                                  style: TextStyle(
                                      fontSize: 64,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.green1)),
                              Image.asset(MyImages.bmiBar),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                buildColumn('${weight} Kg','Weight'),
                                buildColumn('${height.toInt()} cm','Height'),
                                buildColumn('${age}','Age'),
                                buildColumn('Male','Gender'),
                              ],)
                            ],
                          ),
                          actions: [SizedBox(width: 290,height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Close',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: MyColors.white),
                              ),style: ElevatedButton.styleFrom(backgroundColor: MyColors.green),
                            ),
                          )],
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

  Column buildColumn(String text1,String text2) {
    return Column(children: [
                                Text(text1,style:  TextStyle(color: MyColors.green1,fontSize: 20),),
                                Text(text2,style:  TextStyle(fontSize: 14,color: MyColors.grey1))
                              ],);
  }
}

String getResult(double h, int w) {
  double result = (w) / (h * h * 0.0001);
  return result.toStringAsFixed(2);

}
String getresult(double x){
  if(x<18.5){
    return 'Underweight';
  }
  else if( x>=18.5 && x<24.9){
    return 'Normal weight';
  }
  else if( x>=25 && x<29.9){
    return 'Overweight';
  }
  else ( x>=30 && x<40);
  return 'Obesity';

}
