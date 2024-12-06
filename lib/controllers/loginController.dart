import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sih_project/screens/loginScreen.dart';
import 'package:sih_project/screens/homeScreen.dart';

class Logincontroller extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString email = ''.obs;
  RxString password = ''.obs;

  //Login Method
  Future<void> login() async{
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
              email: email.value, password: password.value);
      
      if (userCredential.user != null) {
        Get.to(() => HomeScreen());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }


  Future<void> signup() async{
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email.value, password: password.value);
      if (userCredential.user != null) {
        Get.snackbar('user created', 'Back to Login');
        Get.to(() => Loginscreen());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}