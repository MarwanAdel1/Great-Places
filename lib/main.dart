import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_plcaes.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:great_places_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

import 'screens/place_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.ROUTE_NAME: (ctx) => AddPlaceScreen(),
          PlaceDetailScreen.ROUTE_NAME: (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
