import 'package:dissertation_project/widgets/progressCircleWidget.dart';
import 'package:flutter/material.dart';
import 'package:dissertation_project/widgets/textFormatWidget.dart';

class WeeklyProgress extends StatelessWidget {
  const WeeklyProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height *  0.23,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xff3d3d3d),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormatWidget(20, "Daily average :")),
            ),
            const SizedBox(
              height: 10,
            ),
                Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    ProgressCircle("Mon", 0.7, Colors.red),
                    ProgressCircle("Tue", 0.1, Colors.cyan),
                    ProgressCircle("Wed", 0.2, Colors.teal),
                    ProgressCircle("Thur", 0.3, Colors.amber),
                    ProgressCircle("Fri", 0.4, Colors.green),
                    ProgressCircle("Sat", 0.5, Colors.indigo),
                    ProgressCircle("Sun", 0.6, Colors.purple),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
