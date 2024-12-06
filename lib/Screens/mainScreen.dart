import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sih_project/screens/loginScreen.dart';


class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 86,
          ),
          Container(
            height: screenHeight/2.2,
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/images/mainimg.png'),
            ),
          ),
           SizedBox(
            height: 26,
          ),

          Text(
            '"મૌનની ભાષા સમજવા માટે, દિલની ભાષા જરૂરિયાત છે."',
            style: TextStyle(
              fontSize: textScale.scale(24),
              fontFamily: 'DMSansRegular',
              fontWeight: FontWeight.w700,
              
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            height: 27,
          ),

          Container(
                    height: screenHeight/17,
                    width: screenWidth/1.2,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => Loginscreen());
                      },
                      child: Text("Get Started",style: TextStyle(fontFamily: 'DMSansBlack',color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 0,
                        backgroundColor: Color(0XFF9747FF)
                      )
                    ),
                  ),
        ],
      ),
    );
  }
}