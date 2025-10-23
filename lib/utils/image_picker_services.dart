import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../views/custom_widgets/custom_snackbar.dart';


class ImagePickerService {
  ImagePickerService._();

  static final ImagePickerService _instance = ImagePickerService._();

  factory ImagePickerService() {
    return _instance;
  }

  final ImagePicker _picker = ImagePicker();

  Future<File> _compressImage(String imagePath) async {
    File imageFile = File(imagePath);
    final filePath = imageFile.absolute.path;
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splatted = filePath.substring(0, (lastIndex));
    final outPath = "${splatted}_out${filePath.substring(lastIndex)}";

    XFile? result = await FlutterImageCompress.compressAndGetFile(
      imageFile.absolute.path,
      outPath,
      quality: 50,
    );
    if(result!=null){
      imageFile = File(result.path);
    }
    return imageFile;
  }

  Future<String?> pickImageFromCamera() async {
    PermissionStatus permissionStatus = await Permission.camera.request();
    if(permissionStatus.isGranted){
      try{
        final photo = await ImagePicker().pickImage(
            source: ImageSource.camera,
            maxWidth: 480,
            maxHeight: 630,
            imageQuality: 100);
        if(photo!=null){
          File compressedImage = await _compressImage(photo.path);
          return compressedImage.path;
        }
        return null;
      }on Exception catch (e){
        showCustomSnackbar(
          "Error!",
          "Error picking image from camera: $e",
        );
        return null;
      }
    }else{
      return null;
    }
  }

  Future<String?> pickImageFromGallery() async {
  PermissionStatus permissionStatus;

  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    int androidSdkVersion = androidInfo.version.sdkInt;

    if (androidSdkVersion < 33) {
      permissionStatus = await Permission.storage.request();
    } else {
      permissionStatus = await Permission.photos.request();
    }
  } else if (Platform.isIOS) {
    permissionStatus = await Permission.photos.request();
  } else {
    return null;
  }

  if (!permissionStatus.isGranted) {
    showCustomSnackbar(
      "Permission Denied",
      "Please grant permission to access the gallery."
    );
    return null;
  }

  try {
    final photo = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 480,
      maxHeight: 630,
      imageQuality: 100,
    );

    if (photo != null) {
      File compressedImage = await _compressImage(photo.path);
      return compressedImage.path;
    } else {
      log("No image selected from the gallery.");
      return null;
    }
  } catch (e) {
    log("Error picking image from gallery: $e");
    showCustomSnackbar(
      "Error!",
      "Error picking image: $e",
    );
    return null;
  }
}


  Future<dynamic> uploadImageToFirebase(String image, String path) async {
    if(image.isEmpty) {
      return;
    }
    try {
      log("Image selected: $image");
      final file = File(image);
      if (!file.existsSync()) {
        log("File does not exist at path: $image");
        throw Exception("File not found.");
      }
      final ref = FirebaseStorage.instance
          .ref()
          .child('$path/${DateTime.now().toUtc().millisecondsSinceEpoch}.jpg');
      log("Firebase reference created: $ref");
      UploadTask uploadTask = ref.putFile(file);
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        log("Upload progress: ${snapshot.bytesTransferred} / ${snapshot.totalBytes}");
      }, onError: (e) {
        log("Upload error: $e");
      });
      final TaskSnapshot taskSnapshot = await uploadTask;
      log("Upload task completed: $taskSnapshot");
      final imageUrl = await ref.getDownloadURL();
      log("Image uploaded successfully: $imageUrl");
      return imageUrl;
    } catch (e) {
      log("Upload failed: $e");
      showCustomSnackbar(
        'Error',
        'Failed to upload image.'
      );
    }
  }
}