import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image-input.dart';
import '../providers/great-places.dart';


class AddPlace extends StatefulWidget {
  const AddPlace({super.key});
  static const routeName = '/add-place';
  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titlecontroller = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace(){
    if (_titlecontroller.text.isEmpty || _pickedImage == null){
      return ;
    }
    Provider.of<GreatPlaces>(context,listen: false)
      .addplace(_titlecontroller.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a new PLace')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: _titlecontroller,
                    ),
                    SizedBox(height: 10,),
                    ImageInput(_selectImage)

                  ],
                ),
              ),
            )
          ),
          
          ElevatedButton.icon(
            onPressed: _savePlace, 
            icon:const Icon(Icons.add), 
            label:const  Text('Add please'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).accentColor,
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap
            ),
          )
        ]
      ),
    );
  }
}