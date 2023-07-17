import 'package:bmicalculator/constant.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 150;
  int minHeight = 20;
  int maxHeight = 240;
  int age = 20;
  int weight = 50;
  late double bmi = calculateBMI(height: height, weight: weight);
  String gender = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'BMI Calculator',
            )),
        backgroundColor: kBackgroundColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: kBackgroundColor,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = 'M';
                    });
                  },
                  child: Container(
                    height: 70,
                    width: screenWidth * 0.43,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: gender == 'M' ? kButtonColor : kBoxColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.male,
                          size: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = 'F';
                    });
                  },
                  child: Container(
                    height: 70,
                    width: screenWidth * 0.43,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: gender == 'F' ? kButtonColor : kBoxColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.female,
                          size: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: kBoxColor, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ]),
              child: Column(
                children: [
                  const Text(
                    'HEIGHT(cm)',
                    style: TextStyle(
                      color: kLabelTextColor,
                      fontSize: 20,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Text(
                    "$height",
                    style: kInputTextStyle,
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        overlayColor: const Color(0xFFFE0167).withOpacity(0.5),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15)),
                    child: Slider(
                        value: height.toDouble(),
                        min: minHeight.toDouble(),
                        max: maxHeight.toDouble(),
                        divisions: 220,
                        thumbColor: const Color(0xFFFE0167),
                        activeColor: Colors.white,
                        inactiveColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                          bmi = calculateBMI(height: height, weight: weight);
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  height: 160,
                  width: screenWidth * 0.43,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(color: kBoxColor, boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                            color: kLabelTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        Text(
                          '$weight',
                          style: kInputTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: FloatingActionButton(
                                onPressed: () {
                                  if (weight <= 240 && weight > 0) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                                backgroundColor: kButtonColor,
                              ),
                            ),
                            const SizedBox(width: 25),
                            Container(
                              height: 50,
                              width: 50,
                              child: FloatingActionButton(
                                onPressed: () {
                                  if (weight <= 240 && weight > 0) {
                                    setState(() {
                                      weight++;
                                    });
                                  }
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                                backgroundColor: kButtonColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 160,
                  width: screenWidth * 0.43,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(color: kBoxColor, boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                            color: kLabelTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "$age",
                          style: kInputTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: FloatingActionButton(
                                onPressed: () {
                                  if (age <= 120 && age > 0) {
                                    setState(() {
                                      age--;
                                    });
                                  }
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                                backgroundColor: kButtonColor,
                              ),
                            ),
                            const SizedBox(width: 25),
                            Container(
                              height: 50,
                              width: 50,
                              child: FloatingActionButton(
                                onPressed: () {
                                  if (age <= 120 && age > 0) {
                                    setState(() {
                                      age++;
                                    });
                                  }
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                                backgroundColor: kButtonColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 540,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: kBoxColor, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ]),
              child: Column(
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(
                      color: kLabelTextColor,
                      fontSize: 20,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Text(bmi.toStringAsFixed(2), style: kInputTextStyle),
                  const Padding(padding: EdgeInsets.all(5)),
                  Text(
                    getResults(bmi),
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height) * 10000);
  }

  String getResults(bmiValue) {
    if (bmi >= 30.00) {
      return 'OBESE';
    } else if (bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (bmi > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }
}
