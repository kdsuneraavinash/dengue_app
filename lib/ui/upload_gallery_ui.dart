import 'dart:io';

import 'package:dengue_app/ui/upload_abstract_ui.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadGallery extends UploadAbstract {
  @override
  UploadAbstractState createState() {
    return UploadGalleryState();
  }
}

class UploadGalleryState extends UploadAbstractState {
  @override
  void handleBrowseImage(String userId) async {
    File browsedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      mediaFile = browsedImage;
    });
  }

  IconData backgroundIcon = Icons.image;
}
