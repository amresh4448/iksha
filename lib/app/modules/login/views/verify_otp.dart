import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/login_controller.dart';

class VerfiyOtp extends GetView<LoginController> {
  VerfiyOtp({super.key});
  final loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "+91 ${loginC.mobileNumC.text}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                "Verification",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                "we have a send 4 digit verificttion code to your phone number. please enter the code below to Verify it's you",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: OTPTextField(
                controller: loginC.otpfiledC,
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 75,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceBetween,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  loginC.otp.value = pin;
                  print("Completed: " + pin);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("I didn't get the code  "),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Resend Code",
                    style: TextStyle(
                      color: Color(0xFF70BB76),
                      fontWeight: FontWeight.w600,
                      //decoration: TextDecoration.underline,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              height: 45,
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0xFF70BB76),
                  ),
                  onPressed: () async {
                    loginC.otpfiledC.set(["1", "2", "3", "4"]);
                    if (controller.isLoading.isFalse) {
                      bool? cekAutoLogout = await loginC.verfiyOtp();
                      if (cekAutoLogout != null && cekAutoLogout == true) {
                        Get.offAllNamed(Routes.HOME);
                      }
                    }
                  },
                  child: loginC.isLoading.isFalse
                      ? const Text(
                          "Verify OTP",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        )
                      : CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.to(HomeView());
                },
                child: Text("Without verification")),
          ],
        ),
      ),
    );
  }
}
