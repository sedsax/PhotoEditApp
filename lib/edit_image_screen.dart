import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditImageScreen extends StatefulWidget {
  final XFile image;
  const EditImageScreen({super.key, required this.image});

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
                File(widget.image.path),
                // width: 300,
                // height: 300,
              ),
          ],
        ),
      ),
    );
  }
}