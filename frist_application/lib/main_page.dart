import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frist_application/constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 30;

  late double bmi = calculatBMI(height: height, weight: weight);
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Male");
                      setState(() {
                        gender = 'M';
                      });
                    },
                    child: Container(
                      height: 175,
                      width: 175,
                      decoration: BoxDecoration(
                          color: gender == 'M'
                              ? Colors.orange.withAlpha(150)
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          children: const [
                            Icon(Icons.male, size: 150, color: Colors.black),
                            Text(
                              "Male",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("Female");
                      setState(() {
                        gender = 'F';
                      });
                    },
                    child: Container(
                      height: 175,
                      width: 175,
                      decoration: BoxDecoration(
                          color: gender == 'F'
                              ? Colors.orange.withAlpha(150)
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          children: const [
                            Icon(Icons.female, size: 150, color: Colors.black),
                            Text(
                              "Female",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text("$height", style: kTeststyle),
                        Row(
                          children: [
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height > 50) {
                                      height--;
                                      bmi = calculatBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 40,
                                )),
                            const SizedBox(width: 10),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    height++;
                                    bmi = calculatBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text("$weight", style: kTeststyle),
                        Row(
                          children: [
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 10) {
                                      weight--;
                                      bmi = calculatBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 40,
                                )),
                            const SizedBox(width: 10),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                    bmi = calculatBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: kTeststyle.copyWith(
                      color: kBMcolor,
                      fontSize: 60,
                    ),
                  ),
                  Text(
                    getResult(bmi),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculatBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmi) {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
