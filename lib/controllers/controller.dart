import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class FormController extends GetxController{

RxString imagePath = ''.obs;
  


 Future pickImageGallery(context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      imagePath.value = imageTemp.path;
    } catch (e) {
      print('failed to pick image $e');
    }
    
  }

  @override
  void dispose() {
    imagePath.value = '';
    // print('dispose');
    // // TODO: implement dispose
    super.dispose();
  }


}