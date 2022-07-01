import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_application/controllers/controller.dart';
import 'package:student_application/core/constants.dart';

import 'package:student_application/presentation/form/widgets/form_details.dart';
import 'package:student_application/presentation/form/widgets/submit_button_widget.dart';

class ScreenForm extends StatelessWidget {
  int index;
  Map studentDetails;
  bool isEditing;

  ScreenForm(
      {Key? key,
      this.index = 0,
      this.studentDetails = const {},
      this.isEditing = false})
      : super(key: key);

//   @override
//   State<ScreenForm> createState() => _ScreenFormState();
// }

// class _ScreenFormState extends State<ScreenForm> {
//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    FormController formController=Get.put(FormController());

    print('rebvui');

    return Scaffold(
    //  resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white12,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<FormController>(
                      init: FormController(),
                      dispose: (s){
                        formController.imagePath.value = '';
                      },
                      initState: (state) {
                        if (isEditing) {
                          nameController.text = studentDetails['name'];
                          contactController.text =
                            studentDetails['number'];
                          emailController.text = studentDetails['email'];
                         formController.imagePath.value = studentDetails['photo'] ?? ''; 
                        }
                      },
                      builder: (context) {
                        return  FormDetailsWidget();
                      }),
                      
                  kHeight50,
                  kHeight40,
                  SubmitButtomWidget(
                    index: index,
                    isEditing:isEditing,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
