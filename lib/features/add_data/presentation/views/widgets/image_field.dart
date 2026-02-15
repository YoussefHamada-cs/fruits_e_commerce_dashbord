import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
       onTap: () async {
  setState(() => isLoading = true);
  await imagePicker();
  setState(() => isLoading = false);
},
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(fileImage!),
                    )
                  : const Icon(Icons.image_outlined, size: 150),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                onPressed: () {
                  fileImage = null;
                  widget.onFileChanged(fileImage);
                  setState(() {});
                },
                icon: const Icon(Icons.close, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

 Future<void> imagePicker() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile =
      await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    fileImage = File(pickedFile.path);
    widget.onFileChanged(fileImage);
  } else {
    widget.onFileChanged(null);
  }
  setState(() {});
}


}
