import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/controllers/loginController.dart';
import 'package:sih_project/screens/homeScreen.dart';
import 'package:sih_project/screens/signupScreen.dart';




class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});



  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;

    return GetBuilder<Logincontroller>(
      init: Logincontroller(),
      builder: (Logincontroller Lcontroller) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 35,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 280),
                      child: Row(
                        children: [
                          Text(
                            'English',
                            style: TextStyle(
                              fontFamily: 'DMSansSemiBold',
                              fontSize: screenHeight/55,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Image(image: AssetImage('assets/icons/arrow.png'),width: screenWidth/45,height: screenHeight/70,)
                        ],
                      ),
                    ),
              
                    SizedBox(
                      height: 111,
                    ),
              
                    Text(
                      'Log In',
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
                      child: TextField( // email textfield 
                        onChanged: (value) => Lcontroller.email.value = value,
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
                      child: TextField( // password texxtfield
              
                        onChanged: (value) => Lcontroller.password.value = value,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
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
                          Lcontroller.login();
                        },
                        child: Text("Log in",style: TextStyle(fontFamily: 'DMSansBlack',color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          elevation: 0,
                          backgroundColor: Color(0XFF9747FF)
                        )
                      ),
                    ),
              
                  SizedBox(
                      height: 51,
                    ),
              
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            thickness: 1.0, // Thickness of the line
                            color: Colors.grey, // Color of the line,
                            indent: screenWidth/19.7,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Or continue with", // Text in the middle
                            style: TextStyle(
                              fontSize: 16.0, // Font size of the text
                              color: Color(0XFFACADAC), // Color of the text
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.0, // Thickness of the line
                            color: Colors.grey, // Color of the line
                            endIndent: screenWidth/19.7,
                          ),
                        ),
                      ],
                    ),
              
                   SizedBox(height: 43,),
              
              
                   Column(
                     children: [
                       Text(
                        'if you don’t have an account you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'DMSansRegular',
                          fontSize: textScale.scale(17)
                        ),
                       ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'can',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'DMSansRegular',
                                  fontSize: textScale.scale(17)),
                            ),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => Signupscreen()); 
                              },
                              child: Text(
                                'Register here!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'DMSansRegular',
                                  fontSize: textScale.scale(17),
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFF9747FF)
                                ),
                              ),
                            ),
                        ],
                       )
                     ],
                   ),
              
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}