
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:dissertation_project/widgets/textFormatWidget.dart';
import 'package:dissertation_project/widgets/imageViewWidget.dart';

///This class is made to show the dashboard view of the app.
///This consist of showing the steps performed, calories and the distance.

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
                              //This shows the steps counted
                              TextFormatWidget(50, steps.toString()),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                            ],
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 40,
                            width: 300,
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
            ///Show the distance travelled in miles and calories burned.
            ///Along with the icons used.
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
