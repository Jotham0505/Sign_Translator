import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sih_project/controllers/numbersListController.dart';

class NumberlisttileWidget extends StatefulWidget {
  final bool isCompleted;
  final int index;
  final String number;
  const NumberlisttileWidget({super.key, required this.isCompleted, required this.index, required this.number});

  @override
  State<NumberlisttileWidget> createState() => _NumberlisttileWidgetState();
}

class _NumberlisttileWidgetState extends State<NumberlisttileWidget> {
  final Numberslistcontroller ncontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    
    return Row(

      children: [
        Row(
          children: [
            SizedBox(width: 25,),
            SizedBox(
              width: screenWidth / 12,
              child: Text(
                (widget.index + 1).toString() + ".",
                style: TextStyle(
                    fontFamily: 'DMSansBlack', fontSize: textScale.scale(24)),
              ),
            ),
            Text(
              'Number - ${widget.number}',
              style: TextStyle(
                  fontFamily: 'DMSansRegular', fontSize: textScale.scale(16)),
            ),
          ],
        ),
        SizedBox(
          width: screenWidth/2.14,
        ),
        Row(
          children: [
            widget.isCompleted
                ? Image.asset(
                    'assets/images/checkmark.png',
                    height: screenHeight / 32,
                    width: screenWidth / 14.4,
                  )
                : SizedBox(),
            SizedBox(
              width: screenWidth / 36,
            ),
            InkWell(
              onTap: () => ncontroller.playPressed(widget.index, widget.number),
              child: Image.asset(
                'assets/images/playtopic.png',
                height: screenHeight / 18.18,
                width: screenWidth / 8.18,
              ),
            )
          ],
        )
      ],
    );
  }
}