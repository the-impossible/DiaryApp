import 'package:diary/controllers/change_password_controller.dart';
import 'package:diary/controllers/profile_controller.dart';
import 'package:diary/services/signup_form.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:diary/views/sign_in.dart';
import 'package:diary/services/constants.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());

  ProfileController profileController = Get.put(ProfileController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    changePasswordController.userId =
        profileController.userProfile!.id.toString();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, (340 * 1.7777777777777777).toDouble()),
                  painter: MyShape(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 28,
                        color: primaryColor,
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontSize: 28,
                          fontFamily: 'Pacifico-Regular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SignUpForm(
                              text: 'Current Password',
                              icon: Icons.password_rounded,
                              isSecured: true,
                              formController:
                                  changePasswordController.password0,
                              isVisible: true,
                              validator:
                                  changePasswordController.validatePassword,
                            ),
                            SignUpForm(
                              text: 'New Password',
                              icon: Icons.password_rounded,
                              isSecured: true,
                              formController:
                                  changePasswordController.password1,
                              isVisible: true,
                              validator:
                                  changePasswordController.validatePassword,
                            ),
                            SignUpForm(
                              text: 'Confirm Password',
                              icon: Icons.password_rounded,
                              isSecured: true,
                              formController:
                                  changePasswordController.password2,
                              isVisible: true,
                              validator:
                                  changePasswordController.validatePassword,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 10,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (changePasswordController
                                              .password1.text ==
                                          changePasswordController
                                              .password2.text) {
                                        changePasswordController
                                            .changePassword();
                                      } else {
                                        ScaffoldMessenger.of(Get.context!)
                                            .showSnackBar(
                                          SnackBar(
                                            content: CustomSnackBar(
                                                output:
                                                    "New Password and Confirm Password does not match!",
                                                isSuccess: false),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Change Password',
                                    style: TextStyle(
                                      fontFamily: 'SFPBold',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
