import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  @override
  _ShowSimpleMapState createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  GoogleMapController mapController;
  static LatLng _center = const LatLng(27.663204834292603, 85.33919280056136);
  static LatLng _anotherLocation =
      const LatLng(27.661741448168726, 85.34266894321757);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Maps')),
      body: GoogleMap(
        markers: {myMarker, myMarkerTwo},
        mapType: MapType.terrain,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 15.0),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToIntel,
          label: Text('Airport'),
          icon: Icon(Icons.place)),
    );
  }

  static final CameraPosition intelPosition = CameraPosition(
      target: LatLng(27.698528581186434, 85.35933732596922),
      zoom: 14.780,
      bearing: 191.789,
      tilt: 34.89);
  // go to another map postion
  Future<void> _goToIntel() async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition));
  }

  Marker myMarker = Marker(
      markerId: MarkerId("MyMarker"),
      position: _center,
      infoWindow: InfoWindow(title: "MyMarker", snippet: "This is my marker!"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));
  Marker myMarkerTwo = Marker(
      markerId: MarkerId("MyMarkerTwo"),
      position: _anotherLocation,
      infoWindow: InfoWindow(
          title: "MyMarkerTwo", snippet: "This is my second marker!"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange));
}
