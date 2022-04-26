import 'package:flutter/material.dart';
import 'package:dissertation_project/widgets/textFormatWidget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressCircle extends StatelessWidget {
  String day;
  double percentage;
  Color colors;
  ProgressCircle(this.day, this.percentage, this.colors, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 15.0,
              lineWidth: 2.0,
              animation: true,
              percent: percentage,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: colors,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormatWidget(20, day)
          ],
        ),
      ),
    );
  }
}
