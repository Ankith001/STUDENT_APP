import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_application/boxes.dart';
import 'package:student_application/controllers/controller.dart';
import 'package:student_application/models/studentdb.dart';
import 'package:student_application/presentation/form/widgets/form_details.dart';

class SubmitButtomWidget extends StatelessWidget {
  int index;
  bool isEditing;

  SubmitButtomWidget({Key? key, required this.index, required this.isEditing})
      : super(key: key);

  final boxStudent = Boxes.getDetails();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: TextButton(
          child: const Text(
            'Submit',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            elevation: 5,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            if (formGlobalKey.currentState!.validate()) {
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    content: const Text('Successful!'),
                    margin: const EdgeInsets.all(20),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              //   // If the form is valid, display a snackbar. In the real world,
              //   // you'd often call a server or save the information in a database.
              FormController formController = Get.find<FormController>();
              if (isEditing) {
                boxStudent.putAt(
                  index,
                  StudentDB(
                    name: nameController.text,
                    number: int.parse(contactController.text),
                    email: emailController.text,
                    photo: formController.imagePath.value,
                  ),
                );
              } else {
                boxStudent.add(
                  addStudent(
                    context: context,
                    name: nameController.text,
                    number: int.parse(contactController.text),
                    email: emailController.text,
                    photo: formController.imagePath.value,
                  ),
                );
              }

              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}

addStudent(
    {required String name,
    required int number,
    required String email,
    required dynamic photo,
    context}) {
  final studentdbobj =
      StudentDB(name: name, number: number, email: email, photo: photo);

  final box = Boxes.getDetails();
  box.add(studentdbobj);
  Navigator.pop(context);
}
