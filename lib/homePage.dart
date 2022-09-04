import 'dart:math';

import 'package:dissertation_project/views/dashboardCardView.dart';
import 'package:dissertation_project/views/weeklyProgressView.dart';
import 'package:dissertation_project/widgets/headWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sensors_plus/sensors_plus.dart';

///This class purpose is to contain the application logic which consists of the
///calculations needed in collecting steps and output
///It also shows the homepage view.

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  int steps = 0;
  double distanceInMiles = 0.0;
  double sessionTime = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  double previousDistance = 0.0;
  double distance = 0.0;

  ///Widget to used build to display the step count.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Collect accelerometer readings and setting it into the variables to
      ///be used to calculate the magnitude
      body: StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            x = snapShot.data!.x;
            y = snapShot.data!.y;
            z = snapShot.data!.z;
            distance = getSteps(x, y, z);
            if (distance > 6) {
              steps++;
            }
            calories = calculateAverageCalories(steps);
            distanceInMiles = calculateMiles(steps);
          }
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff212121),
                          Color(0xff212121),
                        ])),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            Header(dateTimeNow(), (){
                            }),
                            // this is the farthest button
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                            ),

                          ],
                        ),
                      ),
                      // dashboard card
                      DashboardCardView(steps, distanceInMiles, calories, sessionTime),
                      const WeeklyProgress(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  double getSteps(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousSteps();
    double modDistance = magnitude - previousDistance;
    setPreviousSteps(magnitude);
    return modDistance;
  }

  void setPreviousSteps(double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousSteps() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistance = _pref.getDouble("preValue") ?? 0.0;
    });
  }

  /// Method which multiplies the stride length by the number of steps.
  /// Then to convert into miles we divide by 5280.

  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  /// Method to calculate how many steps performed per minute
  double calculateDuration(double distance, double strideLength, double time) {
    double durationValue = (distance / strideLength / time);
    return durationValue;
  }

  ///calculate average calories burned.
  double calculateAverageCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }

  ///method to calculate calories burned per minute based on intensity
  int calculateCaloriesPerMinute(int MET, int weight){
    int caloriesBurned = ((MET * weight * 3.5) / 200) as int;
    return caloriesBurned;
  }

  ///Method used to collect the date and time to indicate the activity performed
  ///on that date.

  String dateTimeNow(){
    DateTime now =DateTime.now();
    String formatter = DateFormat.yMMMMd().format(now);// 28/03/2020
    return formatter;
  }

  ///Calculate the predicted male stride length based on height
  double getMenStrideLength(int height){
    double stride = (height * 0.415);
    return stride;
  }

  ///Calculate the predicted stride length for women based on height
  double getWomenStrideLength(int height){
    double stride = (height * 0.413);
    return stride;
  }


}

