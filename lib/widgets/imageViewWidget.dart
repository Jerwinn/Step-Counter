import 'package:flutter/material.dart';
import 'package:dissertation_project/widgets/textFormatWidget.dart';

class ImageView extends StatelessWidget {
  String imagePath;
  String number;
  String title;
  ImageView(this.imagePath, this.number, this.title, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width *0.29,
      child: Wrap(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // text
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormatWidget(16, number),
          ),


          TextFormatWidget(12, title),
        ],
      ),
    );
  }
}
