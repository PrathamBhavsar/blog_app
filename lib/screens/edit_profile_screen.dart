import 'dart:io';

import 'package:blog_app/constants/colors.dart';
import 'package:blog_app/constants/paddings.dart';
import 'package:blog_app/constants/textstyles.dart';
import 'package:blog_app/controllers/firebase_controller.dart';
import 'package:blog_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  File? pickedImage;
  bool isPicked = false;
  FirebaseController firebaseController = FirebaseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.scaffoldPadding,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start your profile',
                      style: AppTextStyles.heading,
                    ),
                    Text(
                      "This is how you're displayed in the community",
                      style: GoogleFonts.poppins(
                        color: AppColorsLightMode.text,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: pickedImage == null
                              ? IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          height: 200,
                                          width: 400,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Choose photo from',
                                                style:
                                                    AppTextStyles.btnTextBlack,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  final ImagePicker picker =
                                                      ImagePicker();
                                                  final XFile? image =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  if (image != null) {
                                                    pickedImage =
                                                        File(image.path);
                                                    setState(() {
                                                      isPicked = true;
                                                    });
                                                    if (!context.mounted)
                                                      return;
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 342,
                                                  decoration: BoxDecoration(
                                                      color: AppColorsLightMode
                                                          .text,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: Text(
                                                      'Gallery',
                                                      style: AppTextStyles
                                                          .btnTextWhite,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              GestureDetector(
                                                onTap: () async {
                                                  final ImagePicker picker =
                                                      ImagePicker();
                                                  final XFile? image =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  if (image != null) {
                                                    pickedImage =
                                                        File(image.path);
                                                    setState(() {
                                                      isPicked = true;
                                                    });
                                                    if (!context.mounted)
                                                      return;
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 342,
                                                  decoration: BoxDecoration(
                                                      color: AppColorsLightMode
                                                          .text,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: Text(
                                                      'Camera',
                                                      style: AppTextStyles
                                                          .btnTextWhite,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.account_circle,
                                    size: 100,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(300.0),
                                  child: Image.file(
                                    pickedImage!,
                                    fit: BoxFit.fill,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextField(
                                style: GoogleFonts.poppins(
                                    color: AppColorsLightMode.text,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                controller: nameController,
                                decoration: InputDecoration(
                                  focusColor: AppColorsLightMode.text,
                                  focusedBorder: UnderlineInputBorder(),
                                  hintText: 'Enter your name',
                                  hintStyle: GoogleFonts.poppins(
                                      color: AppColorsLightMode.text,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextField(
                                controller: emailController,
                                style: GoogleFonts.poppins(
                                    color: AppColorsLightMode.text,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  focusColor: AppColorsLightMode.text,
                                  focusedBorder: UnderlineInputBorder(),
                                  hintText: 'Enter your email',
                                  hintStyle: GoogleFonts.poppins(
                                      color: AppColorsLightMode.text,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20), // Add some space before the button
                GestureDetector(
                  onTap: () {
                    firebaseController.saveUserToFirestore(nameController.text,
                        emailController.text, pickedImage!.path);
                    Fluttertoast.showToast(msg: 'Updated!');
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColorsLightMode.primary,
                    ),
                    child: Center(
                        child: Text(
                      "Continue",
                      style: AppTextStyles.btnTextBlack,
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
