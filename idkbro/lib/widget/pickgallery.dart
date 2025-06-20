import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static Future<void> pickimage({required Function(File) onImagepicked}) async {
    final userImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (userImage != null) {
      onImagepicked(File(userImage.path));
    }
  }

  static Future<void> pickFromCamera({
    required Function(File) onImagePicked,
  }) async {
    final userImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (userImage != null) {
      onImagePicked(File(userImage.path));
    }
  }

  static void removeImage({required Function() onRemove}) {
    onRemove();
  }
}
