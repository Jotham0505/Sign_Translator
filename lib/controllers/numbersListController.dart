import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/Screens/numberWriteScreen.dart';
import 'package:sih_project/controllers/writeScreenController.dart';
import 'package:sih_project/Models/numbers.dart';
import 'package:sih_project/screens/writeScreen.dart';

class Numberslistcontroller extends GetxController{
  List<Numbers> numbers = []; 
  WriteSceenController writeSceenController = Get.put(WriteSceenController());

  void playPressed(int idx, String number) {
    writeSceenController.updateIpText(idx, number);
    writeSceenController.update();
    Get.to(() => Numberwritescreen());
  }

  void createNumberList() {
    for(int i = 1; i<10 ; i++){
      String numberName = i.toString();
      numbers.add(Numbers(number: numberName));
    }
  }
}