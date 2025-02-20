import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HFirebaseStorageService extends GetxController {
  static HFirebaseStorageService get instance => Get.find();

  /// Variables
  final _storage = FirebaseStorage.instance;

  /// Upload Local Image from IDE
  /// Returns a Unit8List containing the image data
  Future<Uint8List> getImageDataFromAssests(String path) async {
    try {
      final byteData = await rootBundle.load('assets/images/$path');
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error: $e';
    }
  }

  /// Upload Image using ImageData on the Cloud Firebase Storage
  /// Returns the download URL of the uploaded image
  Future<String> uploadImageData(
      String path, Uint8List imageData, String name) async {
    try {
      final ref = _storage.ref(path).child(name);
      final uploadTask = ref.putData(imageData);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw 'Firebase Error: ${e.message}';
    } on PlatformException catch (e) {
      throw 'Platform Error: ${e.message}';
    } catch (e) {
      throw 'Something went wrong, Please try again later';
    }
  }

  /// Upload Image on Cloud Firebase Storage
  /// Returns the download URL of the uploaded image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = _storage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Error: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Error: ${e.message}';
      }else{
        throw 'Something went wrong, Please try again later';
      }
    }
  }
}
