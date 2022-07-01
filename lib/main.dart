import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_application/models/studentdb.dart';
import 'package:student_application/presentation/list%20of%20students/screen_student_list.dart';

import 'package:hive_flutter/hive_flutter.dart'; 

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
  await Hive.initFlutter();

  Hive.registerAdapter(StudentDBAdapter());
  await Hive.openBox<StudentDB>('studentdb');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ScreenStudentList(),
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white12,
          iconTheme: IconThemeData(),
          elevation: 0,
        ),
      ),
    );
  }
}
