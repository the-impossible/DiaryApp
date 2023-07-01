import 'dart:io';
import 'package:diary/controllers/edit_profile_controller%20.dart';
import 'package:diary/controllers/profile_controller.dart';
import 'package:diary/routes/routes.dart';
import 'package:diary/services/signup_form.dart';
import 'package:diary/utils/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:diary/views/sign_in.dart';
import 'package:diary/services/constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileController profileController = Get.put(ProfileController());
  EditProfileController editProfileController =
      Get.put(EditProfileController());

  final _formKey = GlobalKey<FormState>();

  File? image;

  Future pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return;

      setState(() {
        image = File(pickedFile.path);
        editProfileController.image = image;
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: CustomSnackBar(
              output: "Failed to Capture image: $e", isSuccess: false),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    editProfileController.nameController.text =
        profileController.userProfile!.name;
    editProfileController.usernameController.text =
        profileController.userProfile!.username;
    if (profileController.userProfile!.phone != null) {
      editProfileController.phoneController.text =
          profileController.userProfile!.phone;
    }
    editProfileController.emailController.text =
        profileController.userProfile!.email;

    editProfileController.userId = profileController.userProfile!.id.toString();
  }

  @override
  Widget build(BuildContext context) {
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
                        "Update Profile",
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
                      padding: const EdgeInsets.only(top: 20),
                      child: Stack(
                        children: [
                          Center(
                            child: CircleAvatar(
                              maxRadius: 50,
                              minRadius: 50,
                              child: ClipOval(
                                child: (image != null)
                                    ? Image.file(
                                        image!,
                                        width: 160,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.memory(
                                        profileController.userProfile!.image,
                                        width: 160,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 60,
                              left: 80,
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  pickImage();
                                },
                                child: const CircleAvatar(
                                  backgroundColor: primaryColor,
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: tertiaryColor,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SignUpForm(
                              text: 'Name',
                              icon: Icons.person_outline_rounded,
                              isSecured: false,
                              formController:
                                  editProfileController.nameController,
                              isVisible: false,
                              validator: editProfileController.validateName,
                            ),
                            SignUpForm(
                              text: 'Username',
                              icon: Icons.manage_accounts,
                              isSecured: false,
                              formController:
                                  editProfileController.usernameController,
                              isVisible: false,
                              validator: editProfileController.validateUsername,
                            ),
                            SignUpForm(
                              text: 'Email',
                              icon: Icons.mail,
                              isSecured: false,
                              formController:
                                  editProfileController.emailController,
                              isVisible: false,
                              validator: editProfileController.validateEmail,
                            ),
                            SignUpForm(
                              text: 'Phone Number',
                              icon: Icons.call,
                              isSecured: false,
                              formController:
                                  editProfileController.phoneController,
                              isVisible: false,
                              validator:
                                  editProfileController.validatePhoneNumber,
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
                                      editProfileController.updateAccount();
                                    }
                                  },
                                  child: const Text(
                                    'Update Profile',
                                    style: TextStyle(
                                      fontFamily: 'SFPBold',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: TextButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.changePassword),
                                    child: const Text(
                                      'Change Password',
                                      style: TextStyle(
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'SFPReg',
                                        color: primaryColor,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
