import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LockDialogWidget {
  static void showLockDialog(
      BuildContext context, double screenHeight, double screenWidth) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0XFFDBC0FF),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(width: 1, color: Color(0XFF9747FF)),
            ),
            height: screenHeight / 2.73,
            width: screenWidth / 9.80,
            //color: Color(0XFFDBC0FF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight / 47),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth / 22.5),
                  child: const Text(
                    'Uh-oh! This level is locked. Finish the previous level to unlock it!',
                    style: TextStyle(
                      fontFamily: "DMSansBlack",
                      fontSize: 19,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight / 80),
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF9747FF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    height: screenHeight / 23.52,
                    width: screenWidth / 2.92,
                    child: Center(
                      child: Text(
                        'Okay!',
                        style: TextStyle(
                          fontFamily: "DMSansSemiBold",
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                /*SizedBox(
                  height: screenHeight / 5.19,
                  width: screenWidth / 1.5,
                  child: Image.asset(
                    'assets/images/dialoglogo.png',
                    // height: screenHeight / 5.19,
                    // width: screenWidth / 1.5,
                  ),
                ),*/
                //ElevatedButton(onPressed: ()=> Get.back(), child: ,style: ButtonStyle(shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular())),backgroundColor: WidgetStateProperty.all(Colors.red)),)
              ],
            ),
          ),
        );
     },
);
}
}