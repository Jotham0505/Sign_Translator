import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/Screens/Assessment/testCompleteScreen.dart';
import 'package:sih_project/Screens/Assessment/testSignScreen.dart';
import 'package:sih_project/Screens/Assessment/testWriteScreen.dart';
import 'package:sih_project/Screens/homeScreen.dart';
import 'package:sih_project/Screens/splashScreen.dart';
import 'package:sih_project/firebase_options.dart';
import 'package:sih_project/Screens/loginScreen.dart';
import 'package:sih_project/Screens/mainScreen.dart';
import 'package:sih_project/widgets/alphabetListTile_widget.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen()
    );
  }
}


