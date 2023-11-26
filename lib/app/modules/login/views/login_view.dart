import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final loginC = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/tracking.png'),
                    fit: BoxFit.cover,
                    // colorFilter:
                    //     ColorFilter.mode(Colors.white, BlendMode.colorBurn)
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome To IKSHA ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextFormField(
                  controller: loginC.mobileNumC,
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                  maxLength: 10,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      // prefixIcon: const Padding(
                      //   padding: EdgeInsets.all(8),
                      //   child: FaIcon(FontAwesomeIcons.mobile),
                      // ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 17.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Don't have an account ? "),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Conact Iksha",
                      style: TextStyle(
                        color: Color(0xFF70BB76),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
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
                        backgroundColor: const Color(0xFF70BB76),
                      ),
                      onPressed: () async {
                        if (controller.isLoading.isFalse) {
                          bool? res = await loginC.postDataSendOtp();
                          if (res != null && res == true) {
                            Get.offAllNamed(Routes.VERIFYOTP);
                          }
                        }

                        // Get.to(VerfiyOtp());
                      },
                      child: loginC.isLoading.isFalse
                          ? const Text(
                              "Send OTP",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            )
                          : const CircularProgressIndicator(),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
