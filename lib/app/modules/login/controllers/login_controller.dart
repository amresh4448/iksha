import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:otp_text_field/otp_field.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final isLoading = false.obs;
  TextEditingController mobileNumC = TextEditingController(text: '9110373120');
  OtpFieldController otpfiledC = OtpFieldController();
  final otp = ''.obs;
  final Dio _dio = Dio(); // Create a Dio instance

  Future<bool?> postDataSendOtp() async {
    isLoading.value = true;
    try {
      final options = Options(
          // headers: {
          //   'Authorization': 'Bearer <token>', // Add any necessary headers
          //   'Content-Type': 'application/json', // Set the content type
          // },
          );
      final response = await _dio.post(
        'http://api.iksha.io:7070/iksha/generateotp', // Replace with your API endpoint URL
        data: {
          "type": "d",
          "deviceId": "713472148553",
          "number": mobileNumC.text,
          "firebaseToken": "AIzaSyAZgsa3p3DwS15BPtTR5SYcU2waE-OlF0I",
          "deviceDetails": "1234"
        },
        options: options, // Use the configured options
      );
      if (response.statusCode == 200) {
        // Request was successful, process the response data
        final responseData = response.data;
        Get.snackbar(
          "${response.data}",
          response.statusCode.toString(),
        );
        print('Response data: ${responseData}');
      } else {
        // Handle error conditions
        print('Error: ${response.statusMessage}');
      }
      return true;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("ERROR", e.toString(), duration: Duration(seconds: 30));
      print('Error occurred: $e');
    }
    return null;
  }

  Future<bool?> verfiyOtp() async {
    isLoading.value = true;
    try {
      print("ggggggggg${otp.value}");

      final options = Options(
          // headers: {
          //   'Authorization': 'Bearer <token>', // Add any necessary headers
          // 'Content-Type': 'application/json', // Set the content type
          // },
          );
      final response = await _dio.post(
        'http://api.iksha.io:7070/iksha/login', // Replace with your API endpoint URL
        data: {
          "type": "d",
          "deviceId": "713472148553",
          "OTP": otp.value,
          "firebaseToken": "AIzaSyAZgsa3p3DwS15BPtTR5SYcU2waE-OlF0I",
          "deviceDetails": "1234"
        },
        options: options, // Use the configured options
      );

      if (response.statusCode == 200) {
        // Request was successful, process the response data
        final responseData = response.data;
        Get.snackbar("${response.data}", response.statusCode.toString(),
            duration: Duration(seconds: 30));
        print('Response data: ${responseData}');
      } else {
        // Handle error conditions
        print('Error: ${response.statusMessage}');
      }

      return true;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("ERROR", e.toString(), duration: Duration(seconds: 30));

      print('Error occurred: $e');
    }
    return null;
  }
}
