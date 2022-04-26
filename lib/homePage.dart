import 'dart:math';

import 'package:dissertation_project/views/dashboardCardView.dart';
import 'package:dissertation_project/views/weeklyProgressView.dart';
import 'package:dissertation_project/widgets/headWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sensors_plus/sensors_plus.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (context, snapShort) {
          if (snapShort.hasData) {
            x = snapShort.data!.x;
            y = snapShort.data!.y;
            z = snapShort.data!.z;
            distance = getValue(x, y, z);
            if (distance > 6) {
              steps++;
            }
            calories = calculateCalories(steps);
            sessionTime = calculateDuration(steps);
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

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistance;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistance = _pref.getDouble("preValue") ?? 0.0;
    });
  }

  /// Method which multiplies the stride length by the number of steps.
  /// Then to convert into miles we divide by 5280.
  ///
  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }

  String dateTimeNow(){
    DateTime now =DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String date2 = date.toString().substring(0,10);
    String formatter = DateFormat.yMMMMd().format(now);// 28/03/2020
    return formatter;
  }
}

