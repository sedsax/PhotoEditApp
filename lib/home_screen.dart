import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_edit_app/edit_image_screen.dart';
import 'package:photo_edit_app/selected_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SelectedImages selectedImages = SelectedImages();

  void pickImageFromSource(ImageSource source) async {
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
    if (storageStatus.isGranted) {
      final ImagePicker imagePicker = ImagePicker();
      final XFile? image = await imagePicker.pickImage(source: source);
      if (image != null) {
        selectedImages.pickedImages.add(image);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditImageScreen(image: image),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  pickImageFromSource(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.photo,
                  size: 40,
                )),
            IconButton(
                onPressed: () {
                  pickImageFromSource(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera_alt,
                  size: 40,
                ))
          ],
        ),
      ],
    );
  }
}
