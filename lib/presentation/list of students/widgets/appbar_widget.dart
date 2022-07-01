import 'package:flutter/material.dart';
import 'package:student_application/presentation/form/screen_form.dart';
import 'package:student_application/presentation/form/widgets/form_details.dart';


class MainAppBarActionWidget extends StatelessWidget {
  const MainAppBarActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          primary: Colors.white,
          elevation: 1,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          clearText(); 
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  ScreenForm(), 
            ),
          );
        },
        icon: const Icon(
          Icons.login,
          size: 12,
        ),
        label: const Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}
