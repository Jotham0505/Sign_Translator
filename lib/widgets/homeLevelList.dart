import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/controllers/homeScreenController.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class HomeLevelWidget extends StatefulWidget {
  final int idx;
  final String title;
  final String subtitle;
  final double range;
  final bool isUnlocked;
  final String imgPath;

  HomeLevelWidget({
    required this.title,
    required this.subtitle,
    required this.range,
    required this.isUnlocked,
    super.key,
    required this.imgPath,
    required this.idx,
  });

  @override
  State<HomeLevelWidget> createState() => _HomeLevelWidgetState();
}

class _HomeLevelWidgetState extends State<HomeLevelWidget> {
  final HomeScreenController homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return Row(
      children: [
        SizedBox(
          height: screenHeight / 14.28,
          width: screenWidth / 6.42,
          child: Image.asset('assets/images/${widget.imgPath}.png'),
        ),
        SizedBox(
          width: screenWidth / 36,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: "DMSansSemiBold",
                fontSize: textScale.scale(16),
                color: Color(0XFF47475D),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight / 50,
                  width: screenWidth / 22.5,
                  child: Image.asset('assets/images/golf.png'),
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontFamily: "DMSansRegular",
                    fontSize: textScale.scale(12),
                    color: Color(0XFF47475D),
                  ),
                )
              ],
            ),
            ProgressBar(
              width: screenWidth / 1.93,
              height: screenHeight / 100,
              value: widget.range,
              color: Color(0XFF6FFF47),
              backgroundColor: Color(0XFFEEF1ED),
            ),
          ],
        ),
        SizedBox(
          width: screenWidth / 36,
        ),
        SizedBox(
          height: screenHeight / 18.18,
          width: screenWidth / 8.18,
          child: widget.isUnlocked
              ? InkWell(
                  onTap: () =>
                      homeScreenController.handleLevelPressing(widget.idx),
                  child: Image.asset('assets/images/play.png'),
                )
              : InkWell(
                onTap: () => homeScreenController.lockedLevelPressed(context,screenWidth,screenWidth),
                  child: Image.asset('assets/images/lock.png'),
                ),
        ),
],
);
}
}