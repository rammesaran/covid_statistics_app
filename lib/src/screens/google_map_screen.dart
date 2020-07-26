import 'package:covid_statistics_app/src/services/webservices.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  Set<Marker> markers = Set<Marker>();
  WebService webService = WebService();
  @override
  void initState() {
    super.initState();
    webService.getWordlNameLocation().then((items) => {
          for (var item in items)
            {
              markers.add(Marker(
                markerId: MarkerId(item?.alpha2code),
                position: LatLng(item?.latitude, item?.longitude),
                infoWindow: InfoWindow(
                  title: item?.name,
                  snippet: item?.alpha2code,
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed,
                ),
              ))
            }
        });
  }

  GoogleMapController mapController;
  // final LatLng _center = const LatLng(20.593684, 78.96288);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        markers: markers,
        compassEnabled: true,
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(35.715298, 51.404343),
        ),
      ),
    );
  }
}
