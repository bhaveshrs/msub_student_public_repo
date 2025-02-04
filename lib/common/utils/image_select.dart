import 'package:image_picker/image_picker.dart';
import 'dart:io';

Future<File> pickImageCamera() async {
  var picker = ImagePicker();
  var image = await picker.pickImage(source: ImageSource.camera, imageQuality: 80, requestFullMetadata: false);
  var imageFile = File(image!.path);
  return imageFile;
}

Future<File> pickImageGallery() async {
  var picker = ImagePicker();
  var image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80, requestFullMetadata: false);
  var imageFile = File(image!.path);
  return imageFile;
}
