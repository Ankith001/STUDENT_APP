

import 'package:hive/hive.dart';
import 'package:student_application/models/studentdb.dart';


class Boxes {

  static Box<StudentDB> getDetails() =>
  Hive.box<StudentDB>('studentdb');

}