import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_application/boxes.dart';
import 'package:student_application/core/constants.dart';
import 'package:student_application/models/studentdb.dart';
import 'package:student_application/presentation/form/screen_form.dart';

class ListOfStudentsWidget extends StatelessWidget {
   ListOfStudentsWidget({
    Key? key,
  }) : super(key: key);



// final studentdatabase = boxStudent.values.toList().cast<StudentDB>();
final boxStudent = Boxes.getDetails();

  List<StudentDB> studentdatabase = [];

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<StudentDB>>(
        valueListenable: Boxes.getDetails().listenable(),
        builder: (context, box, _) {
          studentdatabase = boxStudent.values.toList().cast<StudentDB>();
          return Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, index) {
                if (studentdatabase.isEmpty) {
                  return const Center(
                    child: Text(
                      'No details',
                      style: TextStyle(fontSize: 50, color: Colors.black),
                    ),
                  );
                } else {
                  print(studentdatabase[index].photo);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: ExpansionTile(
                        textColor: Colors.white, backgroundColor: Colors.grey,
                        //initiallyExpanded: true ,
                        tilePadding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        title: Text(
                          studentdatabase[index].name,
                          maxLines: 2,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Text(studentdatabase[index].email),
                        trailing: Text(
                          studentdatabase[index].number.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: studentdatabase[index].photo!.isEmpty
                                    ? const CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg'),
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundImage: FileImage( 
                                          File(studentdatabase[index].photo!),
                                        ),
                                      ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextButton.icon(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      elevation: 1,
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => ScreenForm(
                                          index: index,
                                          studentDetails: {
                                            'name': studentdatabase[index].name,
                                            "number": studentdatabase[index]
                                                .number
                                                .toString(),
                                            "email":
                                                studentdatabase[index].email,
                                            "photo":
                                                studentdatabase[index].photo, 
                                          },
                                          isEditing: true,
                                        ),
                                      ));
                                      //AlertDialogBox();
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 14,
                                    ),
                                    label: const Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextButton.icon(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      elevation: 1,
                                      backgroundColor: Colors.redAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    onPressed: () {
                                      boxStudent.deleteAt(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 14,
                                    ),
                                    label: const Text(
                                      "Delete",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => kHeight5,
              itemCount: studentdatabase.length,
            ),
          );
        });
  }
}
