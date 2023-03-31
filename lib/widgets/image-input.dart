import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  const ImageInput(this.onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture () async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      // maxHeight: ,
      maxWidth: 600
    );
    if(imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile!.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(imageFile!.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/$filename');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey)
          ),
          alignment: Alignment.center,
          child: _storedImage != null 
            ? Image.file(_storedImage!, width: double.infinity, fit: BoxFit.cover,) 
            : Text('No Image'),
         
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            label: Text('Take Picture'),
            icon: Icon(Icons.camera),
            onPressed: _takePicture
          ),
        )
      ],
    );
  }
}