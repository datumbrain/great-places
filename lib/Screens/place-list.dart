import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/great-places.dart';
import './add-new-places.dart';
class PLaceList extends StatelessWidget {
  const PLaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () { 
              Navigator.of(context).pushNamed(AddPlace.routeName);
            }
          )
        ]
      ),
      body: Consumer<GreatPlaces>(
        builder: (ctx, greatplaces, ch) => greatplaces.items.length <=0 ? ch! 
        : ListView.builder(
          itemCount:greatplaces.items.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(greatplaces.items[index].image),
            ),
            title: Text(greatplaces.items[index].title),
            onTap: (){},
          )
        ) ,
        child: const Center(
          child: Text('Got no places yet, Start Adding Some'),
        ),
      )
    );
  }
}