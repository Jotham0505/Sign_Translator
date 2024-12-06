import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sih_project/controllers/loginController.dart';


class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;

    return GetBuilder<Logincontroller>(
      init: Logincontroller(),
      builder: (Logincontroller Scontroller){
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                top: 45,
                left: 29
              ),
              child: Column(
                children: [
                  

                  SizedBox(
                    height: 111,
                  ),

                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'DMSansSemiBold',
                      fontSize: textScale.scale(32),
                      shadows: [
                        Shadow(
                           offset: Offset(0, 4.0), 
                           blurRadius: 4.0, 
                           color: Colors.grey.withOpacity(0.5), 
                        )
                      ]
                    ),
                  ),

                  SizedBox(
                    height: 55,
                  ),

                  Container(
                    height: screenHeight/17,
                    width: screenWidth/1.2,
                     decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(12.0), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.5), 
                          blurRadius: 4, 
                          offset: Offset(0, 2), 
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) => Scontroller.email.value = value,
                      decoration: InputDecoration(
                        hintText: 'Email or Mobile Number',
                        suffixIcon: Image(image: AssetImage('assets/icons/Email.png')),
                        hintStyle: TextStyle(
                          fontFamily: 'DMSansRegular',
                          fontSize: 14,
                          color: Color(0XFF4F555A)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        )
                      ),
                    ),
                  ),
                  
                  SizedBox(
                    height: 21
                  ),

                  Container(
                    height: screenHeight/17,
                    width: screenWidth/1.2,
                     decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(12.0), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.5), 
                          blurRadius: 4, 
                          offset: Offset(0, 2), 
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) => Scontroller.password.value = value,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter new password',
                        suffixIcon: Image(image: AssetImage('assets/icons/Hide.png')),
                        hintStyle: TextStyle(
                          fontFamily: 'DMSansRegular',
                          fontSize: 14,
                          color: Color(0XFF4F555A)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        )
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding: EdgeInsets.only(left: 180),
                      child: Text(
                        'Recover Password ?',
                        style: TextStyle(
                          fontFamily: 'DMSansSemiBold',
                          fontSize: textScale.scale(16),
                          color: Color(0XFFC7C7C7)
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: screenHeight/17,
                    width: screenWidth/1.2,
                    child: ElevatedButton(
                      onPressed: () {
                        Scontroller.signup();
                      },
                      child: Text("Sign Up",style: TextStyle(fontFamily: 'DMSansBlack',color: Colors.white),),
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
            ),
          ),
        );
      },
    );
  }
}