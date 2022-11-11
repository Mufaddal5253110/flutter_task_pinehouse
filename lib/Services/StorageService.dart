import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<String?> uploadImage(File image) async {
    try {
      // Uploading the selected image with some custom meta data
      // Reference ref = storage.ref("profilePhotos/${userid}");
      Reference ref = storage.ref("user/images/${DateTime.now().millisecondsSinceEpoch}");
      await ref.putFile(File(image.path));
      return await ref.getDownloadURL();
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error.message);
      }
      return error.message;
    }
  }
}
