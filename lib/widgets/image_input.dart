import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onSelectImage});

  final void Function(File pickedImage) onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File? _pickedImageFile;

  void _pickImage() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (picker == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(picker.path);
    });

    widget.onSelectImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          foregroundImage: _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
          radius: 50,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image_search_rounded),
          label: const Text(
            "Add image",
          ),
        ),
      ],
    );
  }
}
