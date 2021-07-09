import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_plcaes.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:great_places_app/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.ROUTE_NAME);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text('Got no places yet, start adding some!'),
                ),
                builder: (ctx, greatPlaces, ch) =>
                    greatPlaces.places.length <= 0
                        ? ch
                        : ListView.builder(
                            itemCount: greatPlaces.places.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  greatPlaces.places[i].image,
                                ),
                              ),
                              title: Text(greatPlaces.places[i].title),
                              subtitle:
                                  Text(greatPlaces.places[i].location.address),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  PlaceDetailScreen.ROUTE_NAME,
                                  arguments: greatPlaces.places[i].id,
                                );
                              },
                            ),
                          ),
              ),
      ),
    );
  }
}
