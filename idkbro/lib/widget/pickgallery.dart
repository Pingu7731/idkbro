

import 'package:image_picker/image_picker.dart';

Future pickimage() async{
  final pickedImage = ImagePicker().pickImage(source: ImageSource.gallery);
}