import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:sih_project/controllers/writeScreenController.dart';
import 'package:image/image.dart' as img;

class SignScreenController extends GetxController {
  String screenTitle = "Alphabets";
  int index = 0;
  String inputText = "0";
  String videoUrl = "assets/videos/sample.mp4";
  bool isImgDone = false;
  final WriteSceenController wSController = Get.find();
  late VideoPlayerController videoController;
  ImagePicker _picker = ImagePicker();
  File? image;
  String predictedValue = "";
  String screenTitle1 = "Alphabets";
  String screenTitle2 = "Numbers";

  @override
  void onInit() {
    super.onInit();
    inputText = wSController.inputText;
    videoUrl = "assets/videos/numbers/${inputText}.mp4";
    index = wSController.index;
    screenTitle = wSController.screenTitle1;
    update();

    videoController = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        videoController.setLooping(true);
        videoController.play();
        update();
      });
  }

  Future<void> capturePhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front,
    );

    if (photo != null) {
      File imageFile = File(photo.path);
      img.Image? decodedImage = img.decodeImage(imageFile.readAsBytesSync()); // Decode the image 
      if (decodedImage != null) {
        img.Image resizedImage = img.copyResize(decodedImage, width: 128, height: 128); // the designated pixel ratio for the image
        imageFile.writeAsBytesSync(img.encodeJpg(resizedImage));
        image = imageFile;
        isImgDone = true;
        update();
        print("Image captured and resized: ${imageFile.path}");
      }else{
        print('Failed to decode image');
      }
    }
  }

  


Future<void> submitImage() async {
  if (image == null) {
    print("No image selected");
    return;
  }

  try {
    final bytes = await image!.readAsBytes();
    final encodedImage = base64Encode(bytes);
    print("Image encoded to base64");

    final response = await http.post(
      Uri.parse("https://freakyfifast.us-east-1.modelbit.com/v1/predict_image/latest"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"data": encodedImage}),
    );

    print("Request sent to model");

    if (response.statusCode == 200) {
      print("Raw response from model: ${response.body}");

      // Parse the JSON response
      final decodedResponse = jsonDecode(response.body);

      // Extract the "data" field from the response
      final dataValue = decodedResponse['data'];

      // Check if "data" is a numeric value and increment it
      if (dataValue is int || dataValue is double) {
        final incrementedValue = dataValue + 1;
        
        print("Incremented value: $incrementedValue");
        predictedValue = "Predicted value is: $incrementedValue";
        update();
        //showPredictionDialog(context, incrementedValue);
        // You can now use this incrementedValue
      } else {
        print("Error: 'data' is not a numeric value.");
      }
    } else {
      print("Error: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  } catch (e) {
    print("Error during image submission: $e");
  }
}

/*void showPredictionDialog(BuildContext context, double incrementedValue) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Prediction Result"),
        content: Text("The prediction value is: $incrementedValue"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}*/




  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
