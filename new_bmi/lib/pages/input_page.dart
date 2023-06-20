import 'package:flutter/material.dart';
import 'package:new_bmi/pages/result_page.dart';

import '../gradiant.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String gender = '';
  double age = 0;
  double height = 10;
  double weight = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
          title: const Text(
            "About me",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(" Gender",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              const SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 219, 219, 219),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        gradient: gender == 'Male'
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 112, 213, 183),
                                  Color.fromARGB(255, 14, 153, 111),
                                ],
                                stops: [0.0, 1.0],
                              )
                            : null,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            gender = 'Male';
                          });
                        },
                        padding: const EdgeInsets.only(
                          right: 15.0,
                          left: 15.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.male,
                                size: 26,
                                color: gender == 'Male'
                                    ? Colors.white
                                    : Colors.grey),
                            Text(
                              " Male",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: gender == 'Male'
                                      ? Colors.white
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        gradient: gender == 'Female'
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 112, 213, 183),
                                  Color.fromARGB(255, 14, 153, 111),
                                ],
                                stops: [0.0, 1.0],
                              )
                            : null,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            gender = 'Female';
                          });
                        },
                        padding: const EdgeInsets.only(
                          right: 15.0,
                          left: 15.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.female,
                              color: gender == 'Female'
                                  ? Colors.white
                                  : Colors.grey,
                              size: 26,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  color: gender == 'Female'
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        gradient: gender == 'Other'
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 112, 213, 183),
                                  Color.fromARGB(255, 14, 153, 111),
                                ],
                                stops: [0.0, 1.0],
                              )
                            : null,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            gender = 'Other';
                          });
                        },
                        padding: const EdgeInsets.only(
                          right: 15.0,
                          left: 15.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.transgender,
                              color: gender == 'Other'
                                  ? Colors.white
                                  : Colors.grey,
                              size: 26,
                            ),
                            Text(
                              "Other",
                              style: TextStyle(
                                  color: gender == 'Other'
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //Age
              const SizedBox(height: 25),
              const Text(" Age (years)",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              const SizedBox(height: 5),
              Text(
                " ${age.toInt()}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.grey.shade400,
                  trackShape: const GradientRectSliderTrackShape(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 112, 213, 183),
                        Color.fromARGB(255, 14, 153, 111),
                      ],
                    ),
                  ),
                  trackHeight: 16.0,
                  thumbColor: const Color.fromARGB(255, 14, 153, 111),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 0.0),
                  overlayColor: Colors.white,
                ),
                child: Slider(
                  min: 0,
                  max: 100,
                  value: age,
                  onChanged: (val) {
                    setState(() {
                      age = val;
                    });
                  },
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text('  0', style: TextStyle(color: Colors.black54)),
                  Expanded(child: Container()),
                  const Text('100  ', style: TextStyle(color: Colors.black54))
                ],
              ),

              //Height
              const SizedBox(height: 22),
              const Text(" Height (cm)",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              const SizedBox(height: 5),
              Text(
                " ${height.toInt()}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.grey.shade400,
                  trackShape: const GradientRectSliderTrackShape(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 112, 213, 183),
                        Color.fromARGB(255, 14, 153, 111),
                      ],
                    ),
                  ),
                  trackHeight: 16.0,
                  thumbColor: const Color.fromARGB(255, 14, 153, 111),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 0.0),
                  overlayColor: Colors.white,
                ),
                child: Slider(
                  min: 10,
                  max: 300,
                  value: height,
                  onChanged: (val) {
                    setState(() {
                      height = val;
                    });
                  },
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text('  10', style: TextStyle(color: Colors.black54)),
                  Expanded(child: Container()),
                  const Text('300  ', style: TextStyle(color: Colors.black54))
                ],
              ),
              //weight
              const SizedBox(height: 22),
              const Text(" Weight (kg)",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              const SizedBox(height: 5),
              Text(
                " ${weight.toInt()}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.grey.shade400,
                  trackShape: const GradientRectSliderTrackShape(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 112, 213, 183),
                        Color.fromARGB(255, 14, 153, 111),
                      ],
                    ),
                  ),
                  trackHeight: 16.0,
                  thumbColor: const Color.fromARGB(255, 14, 153, 111),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 0.0),
                  overlayColor: Colors.white,
                ),
                child: Slider(
                  min: 0,
                  max: 300,
                  value: weight,
                  onChanged: (val) {
                    setState(() {
                      weight = val;
                    });
                  },
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text('  0', style: TextStyle(color: Colors.black54)),
                  Expanded(child: Container()),
                  const Text('300  ', style: TextStyle(color: Colors.black54))
                ],
              ),
              Expanded(child: Container()),
              //Calculation button
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 112, 213, 183),
                      Color.fromARGB(255, 14, 153, 111),
                    ],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(23.0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                age: age,
                                gender: gender,
                                weight: weight,
                                height: height,
                              )),
                    );
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 142),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
