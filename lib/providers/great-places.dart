import 'package:flutter/foundation.dart';
import 'dart:io';
import '../model/place.dart';
import '../helpers/db_helpers.dart';
class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addplace (String pickedTitle,File pickedImage){
    final newPlace = Place(
      id: DateTime.now().toString(), 
      title: pickedTitle, 
      location: null, 
      image: pickedImage
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id' : newPlace.id,
      'title' : newPlace.title,
      'image' : newPlace.image.path
    });
  }
}