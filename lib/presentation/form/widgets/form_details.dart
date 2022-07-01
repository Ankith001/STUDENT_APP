import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_application/controllers/controller.dart';
import 'package:student_application/core/constants.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController contactController = TextEditingController();
final TextEditingController emailController = TextEditingController();

void clearText() {
  nameController.clear();
  emailController.clear();
  contactController.clear();
}

final formGlobalKey = GlobalKey<FormState>();

class FormDetailsWidget extends StatelessWidget {
  FormDetailsWidget({
    Key? key,
  }) : super(key: key);

  //final List<String> _items;

//   @override
//   State<FormDetailsWidget> createState() => _FormDetailsWidgetState();
// }

// class _FormDetailsWidgetState extends State<FormDetailsWidget> {
  XFile? image;
  final ImagePicker picker = ImagePicker();



  @override
  Widget build(BuildContext context) {
    FormController formController = Get.find<FormController>();
    print('bul');

    return Form(
      key: formGlobalKey,
      //  autovalidateMode: AutovalidateMode.always,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() =>  Column(
                          children: [
                            formController.imagePath.value.isNotEmpty
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(File(formController.imagePath.value)),
                                  )
                                : const CircleAvatar(
                                    backgroundColor: Colors.white12,
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg'),
                                  ),
                            kHeight10,
                            IconButton(
                              onPressed: () async {
                                await formController.pickImageGallery(context);
                                //  Navigator.pop(context);
                              },
                              icon: const Icon(Icons.file_upload_outlined),
                            )
                          ],
                    
                ))
              ],
            ),
            const Text(
              "Enter Your Details",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHeight20,
            TextFormField(
              validator: validateName,
              keyboardType: TextInputType.text,
              controller: nameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1.5, color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Name ",
                hintStyle: GoogleFonts.inter(),
              ),
            ),
            kHeight20,
            TextFormField(
              validator: validateNumber,
              controller: contactController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(width: 1.5, color: Colors.black)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Contact number",
                hintStyle: GoogleFonts.inter(),
              ),
            ),
            kHeight20,
            TextFormField(
              validator: validateEmail,
              controller: emailController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(width: 1.5, color: Colors.black)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Email",
                hintStyle: GoogleFonts.inter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? value) {
  if (value != null) {
    if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
      return null;
    }
    return 'Enter a Valid Email Address';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null ||
      value.isEmpty ||
      value.contains('@') ||
      value.length < 3 ||
      value.contains('.') ||
      value.contains(RegExp(r'^[0-9]+$'))) {
    return 'Enter minimum 3 characters';
  }
  return null;
}

String? validateNumber(String? value) {
  if (value == null ||
      value.isEmpty ||
      value.contains('@') ||
      value.length != 10 ||
      value.contains('.') ||
      value.contains(RegExp(r'^[a-z]+$'))) {
    return 'Enter a Valid Number';
  }
  return null;
}

