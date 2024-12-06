import 'package:get/get.dart';
import 'package:sih_project/screens/writeScreen.dart';
import 'package:sih_project/models/alphabet.dart';
import 'package:sih_project/controllers/writeScreenController.dart';

class AlphabetsListController extends GetxController {
  List<Alphabet> alphabets = [];
  WriteSceenController writeSceenController = Get.put(WriteSceenController());

  void playPressed(int idx, String letter,) {
    writeSceenController.updateIpText(idx, letter,);
    writeSceenController.update();
    Get.to(() => WriteScreen());
  }

  void createAlphabetList() {
    for (int i = 0; i < 26; i++) {
      String characterName =
          String.fromCharCode(65 + i); // 65 is the ASCII value for 'A'
      alphabets.add(Alphabet(
        letter: characterName,
      ));
    }
  }
  
}
