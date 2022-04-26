
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:dissertation_project/widgets/textFormatWidget.dart';
import 'package:dissertation_project/widgets/imageViewWidget.dart';

class DashboardCardView extends StatelessWidget {
  int steps;
  double miles;
  double calories;
  double duration;


  DashboardCardView(this.steps, this.miles, this.calories, this.duration,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xff3d3d3d),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const FittedBox(
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        // this is for the count in foot step and edit button
                        SizedBox(

                          width: 300,
                          child: Row(

                            children: [
                              TextFormatWidget(50, steps.toString()),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        // this is for the pause button
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 40,
                            width: 400,
                            child: Center(
                              child: Text(
                                "Steps Performed",
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                ImageView(
                    "assets/distance3.png", miles.toStringAsFixed(3), "Miles"),
                const SizedBox(
                  width: 50,
                ),

                ImageView("assets/calories2.png",
                    calories.toStringAsFixed(3), "Calories")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
