import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sih_project/controllers/numbersListController.dart';
import 'package:sih_project/widgets/numberListTile_widget.dart';

class NumberListScreen extends StatefulWidget {
  const NumberListScreen({super.key});

  @override
  State<NumberListScreen> createState() => _NumberListScreenState();
}

class _NumberListScreenState extends State<NumberListScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<Numberslistcontroller>(
      init: Numberslistcontroller(),
      builder: (Numberslistcontroller ncontroller){
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Numbers', style: TextStyle(fontFamily: 'DMSansSemiBold',fontSize: textScale.scale(18),color: Color(0XFF000000),),),
            ),
            body: ListView.builder(
              itemCount: ncontroller.numbers.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    NumberlisttileWidget(
                      isCompleted: ncontroller.numbers[index].isCompleted, 
                      index: index, 
                      number: ncontroller.numbers[index].number,
                    ),
                    SizedBox(
                      height: screenHeight / 35,
                    )
                  ],
                );
              },
            ),
          ),
        );
      }
    );
  }
}