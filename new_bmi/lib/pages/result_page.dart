import 'package:flutter/material.dart';

import '../gauge.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  double age;
  double weight;
  double height;
  String gender;

  ResultPage({
    Key? key,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
  }) : super(key: key);
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
          "BMI Calculator",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 270,
              child: getRadialGauge((weight) / (height * height * 0.0001)),
            ),
            const Text(
              "Your BMI",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              ((weight) / (height * height * 0.0001)).toStringAsFixed(1),
              style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 115),
                padding: const EdgeInsets.symmetric(vertical: 14),
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
                child: Text(
                  ((weight) / (height * height * 0.0001)) <= 18.5
                      ? "Under Weight"
                      : ((weight) / (height * height * 0.0001)) > 18.5 &&
                              ((weight) / (height * height * 0.0001)) <= 25
                          ? "Normal"
                          : ((weight) / (height * height * 0.0001)) > 25 &&
                                  ((weight) / (height * height * 0.0001)) <= 30
                              ? "Over Weight"
                              : ((weight) / (height * height * 0.0001)) > 30 &&
                                      ((weight) / (height * height * 0.0001)) <=
                                          35
                                  ? "Obesity ( Class I )"
                                  : ((weight) / (height * height * 0.0001)) >
                                              35 &&
                                          ((weight) /
                                                  (height * height * 0.0001)) <=
                                              40
                                      ? "Obesity ( Class II )"
                                      : "Extreme Obesity",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 17
            ),
            Text(
              "${weight.toInt()} kg | ${height.toInt()} cm | $gender | ${age.toInt()} years",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ((weight) / (height * height * 0.0001)) >= 18.5 &&
                    ((weight) / (height * height * 0.0001)) < 25
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 20),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 43, 155, 121),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: ((weight) / (height * height * 0.0001)) >= 18.5 &&
                            ((weight) / (height * height * 0.0001)) < 25
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\u{1F44F} Congratulation!',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "You are in a great position Maintain healthy habits to maintain a healthy weight.",
                                style: TextStyle(
                                    height: 1.5,
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 50),
                            ],
                          )
                        : null,
                  )
                : Container()
          ],
        ),
      ),
    ));
  }
}
