import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great-places.dart';
import './Screens/place-list.dart';
import './Screens/add-new-places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PLaceList(),
        routes: {
          AddPlace.routeName:(context) => AddPlace()
        },
      ),
    );
  }
}