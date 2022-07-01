import 'package:hive/hive.dart';

part 'studentdb.g.dart';

@HiveType(typeId: 0)
class StudentDB extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int number;

  @HiveField(2)
  late String email;

  @HiveField(5) 
   String? photo; 

  StudentDB({required this.name,required this.number, required this.email,required this.photo});
   
}
