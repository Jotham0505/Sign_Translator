import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/controllers/alphabetsListController.dart';
import 'package:sih_project/widgets/alphabetListTile_widget.dart';

class AlphabetListScreen extends StatefulWidget {
  const AlphabetListScreen({super.key});

  @override
  State<AlphabetListScreen> createState() => _AlphabetListScreenState();
}

class _AlphabetListScreenState extends State<AlphabetListScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<AlphabetsListController>(
        init: AlphabetsListController(),
        builder: (AlphabetsListController acontroller) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Alphabets',
                style: TextStyle(
                  fontFamily: "DMSansSemiBold",
                  fontSize: textScale.scale(18),
                  color: Color(0XFF000000),
                ),
              ),
            ),
            body: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 15),
              //shrinkWrap: true,
              itemCount: acontroller.alphabets.length,
              itemBuilder: (context, index) {
                //print(acontroller.alphabets[index].letter);
                return Column(
                  children: [
                    AlphabetlisttileWidget(
                        name: acontroller.alphabets[index].letter,
                        index: index,
                        isCompleted: acontroller.alphabets[index].isCompleted),
                    SizedBox(
                      height: screenHeight / 35,
                    )
                  ],
                );
              },
            ),
          ));
        });
  }
}
