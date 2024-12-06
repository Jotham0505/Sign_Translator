import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sih_project/controllers/alphabetsListController.dart';

class AlphabetlisttileWidget extends StatefulWidget {
  final String name;
  final int index;
  final bool isCompleted;
  const AlphabetlisttileWidget(
      {super.key,
      required this.name,
      required this.index,
      required this.isCompleted});

  @override
  State<AlphabetlisttileWidget> createState() => _AlphabetlisttileWidgetState();
}

class _AlphabetlisttileWidgetState extends State<AlphabetlisttileWidget> {
  final AlphabetsListController aLController = Get.find();
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: screenWidth / 10,
              child: Text(
                (widget.index + 1).toString() + ".",
                style: TextStyle(
                    fontFamily: 'DMSansBlack', fontSize: textScale.scale(24)),
              ),
            ),
            // SizedBox(
            //   width: screenWidth / 36,
            // ),
            Text(
              'Letter ${widget.name}',
              style: TextStyle(
                  fontFamily: 'DMSansRegular', fontSize: textScale.scale(16)),
            ),
          ],
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
              onTap: () => aLController.playPressed(widget.index, widget.name),
              child: Image.asset(
                'assets/images/playtopic.png',
                height: screenHeight / 18.18,
                width: screenWidth / 8.18,
              ),
            ),
          ],
        )
      ],
    );
  }
}
