import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/controllers/assessmentController.dart';

class Mainassscreen extends StatefulWidget {
  const Mainassscreen({super.key});

  @override
  State<Mainassscreen> createState() => _MainassscreenState();
}

class _MainassscreenState extends State<Mainassscreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<Assessmentcontroller>(
      init: Assessmentcontroller(),
      builder: (Assessmentcontroller assController) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Assessments',style: TextStyle(fontFamily: 'DMSansSemibold',fontSize: textScale.scale(18)),),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 20,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Letters',style: TextStyle(fontFamily: 'DMSansSemibold',fontSize: 18),),
                  SizedBox(height: 16,),
                  Container(
                    height: screenHeight/5.44,
                    width: screenWidth/1.14,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 157, 88, 248),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth / 20.5,top: 10),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth / 2.05,
                                height: screenHeight / 9.52,
                                child: Text(
                                  'Identify the \ngiven letters',
                                  style: TextStyle(
                                    fontFamily: "DMSansSemibold",
                                    fontSize: textScale.scale(25),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth / 3.05,
                                height: screenHeight / 7.9,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Image.asset('assets/images/abc.png'),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Take test',
                            style: TextStyle(
                                fontFamily: 'DMSansSemibold',
                                fontSize: textScale.scale(15),
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 33,),
                  Text('Numbers',style: TextStyle(fontFamily: 'DMSansSemibold',fontSize: 18),),
                  SizedBox(height: 16,),
                  Container(
                    height: screenHeight/5.44,
                    width: screenWidth/1.14,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFCBA3FF)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth / 20.5,top: 10),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth / 2.05,
                                height: screenHeight / 9.52,
                                child: Text(
                                  'Identify the \ngiven numbers',
                                  style: TextStyle(
                                    fontFamily: "DMSansSemibold",
                                    fontSize: textScale.scale(25),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth / 3.05,
                                height: screenHeight / 7.9,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Image.asset('assets/images/123.png'),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Take test',
                            style: TextStyle(
                                fontFamily: 'DMSansSemibold',
                                fontSize: textScale.scale(15),
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 33,),
                  Text('Maths',style: TextStyle(fontFamily: 'DMSansSemibold',fontSize: 18),),
                  SizedBox(height: 16,),
                  Container(
                    height: screenHeight/5.44,
                    width: screenWidth/1.14,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFA5B2FC)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth / 20.5,top: 10),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth / 2.05,
                                height: screenHeight / 9.52,
                                child: Text(
                                  "Let's play with \nnumbers",
                                  style: TextStyle(
                                    fontFamily: "DMSansSemibold",
                                    fontSize: textScale.scale(25),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth / 3.05,
                                height: screenHeight / 7.9,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Image.asset('assets/images/maths.png'),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Take test',
                            style: TextStyle(
                                fontFamily: 'DMSansSemibold',
                                fontSize: textScale.scale(15),
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        );
      },
    );
  }
}


/*Row(
                      
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 26,right: 108,top: 14),
                              child: Text(
                                  'Identify the \ngiven letters',
                                  style: TextStyle(
                                    fontFamily: 'DMSansSemibold',
                                    fontSize: textScale.scale(25),
                                  ),
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 140,bottom: 21),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Take test',
                                    style: TextStyle(
                                        fontFamily: 'DMSansSemibold',
                                        fontSize: textScale.scale(15),
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                            ),
                            
                          ],
                        ),
                      
                      ],
                    ),*/