import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LatLng? _currentLocation;

  final List<LatLng> pickupLocations = [
    LatLng(12.971598, 77.594566), 
   LatLng(12.972819, 77.595212),    LatLng(12.963842, 77.609043),
  ];

  final LatLng warehouseLocation = LatLng(12.961115, 77.600000); 

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;
    
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) return;

    

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print("Error fetching location: $e");
    }

  }

  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {};

    if (_currentLocation != null) {
      markers.add(Marker(
        markerId: MarkerId("current"),
        position: _currentLocation!,
        infoWindow: InfoWindow(title: "Your Location"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ));
    }

    for (int i = 0; i < pickupLocations.length; i++) {
      markers.add(Marker(
        markerId: MarkerId("pickup_$i"),
        position: pickupLocations[i],
        infoWindow: InfoWindow(title: "Pickup ${i + 1}"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ));
    }

    markers.add(Marker(
      markerId: MarkerId("warehouse"),
      position: warehouseLocation,
      infoWindow: InfoWindow(title: "Warehouse"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your route')),
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) => mapController = controller,
              initialCameraPosition: CameraPosition(
                target: _currentLocation!,
                zoom: 6.0,
              ),
              markers: _buildMarkers(),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
    );
  }
}
