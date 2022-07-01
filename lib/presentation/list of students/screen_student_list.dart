

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_application/core/constants.dart';
import 'package:student_application/presentation/list%20of%20students/widgets/listing_students.dart';
import 'package:student_application/presentation/list%20of%20students/widgets/recent_reg.dart';

import 'widgets/appbar_widget.dart';

class ScreenStudentList extends StatelessWidget {
  const ScreenStudentList({Key? key}) : super(key: key);



  // @override
  // void dispose() {
  //   Hive.box('studentdb').close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [MainAppBarActionWidget()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const RecentRegistrationWidget(),
          kHeight20,
          ListOfStudentsWidget(),
        ],
      ),
    );
  }
}
