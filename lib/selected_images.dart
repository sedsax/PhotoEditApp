import 'package:image_picker/image_picker.dart';

class SelectedImages{
  static final SelectedImages _selectedImages = SelectedImages._internal();
  factory SelectedImages() => _selectedImages;

  SelectedImages._internal();

  List<XFile> pickedImages = [];
}