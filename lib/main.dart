import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: FireMap()
        )
    );
  }
}
class FireMap extends StatefulWidget {
  @override
  State createState() => FireMapState();
}




class FireMapState extends State<FireMap> {
  late GoogleMapController mapController;

  @override
  build(context) {
    return Stack(
        children: [
          GoogleMap(
              initialCameraPosition: const CameraPosition(target: LatLng(24.150, -110.32), zoom: 10),
              onMapCreated: _onMapCreated,
              myLocationEnabled: true, // Add little blue dot for device location, requires permission from user
              mapType: MapType.hybrid,
              trackCameraPosition: true

          ),
          Positioned(
              bottom: 50,
              right: 10,
              child:
              // ignore: deprecated_member_use
              FlatButton(
                  child:  Icon(Icons.pin_drop),
                  color: Colors.green,
                  onPressed: () => _addMarker()
              )
          )
        ]
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}


_addMarker() {
  var marker = Marker(
      position: mapController.cameraPosition.target,
      icon: BitmapDescriptor.defaultMarker,
      infoWindowText: InfoWindowText('Magic Marker', '🍄🍄🍄')
  );

  mapController.addMarker(marker);
}

Location location = new Location();

_animateToUser() async {
  var pos = await location.getLocation();

  mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(pos.latitude, pos.latitude),
        zoom: 17.0,
      )
  )
  );
}
class FireMapState extends State<FireMap> {
  // omitted...

  Firestore firestore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();

// ...
}

