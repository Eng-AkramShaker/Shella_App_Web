import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
    
class TrackingMap extends StatefulWidget {
  const TrackingMap({Key? key}) : super(key: key);

  @override
  _TrackingMapState createState() => _TrackingMapState();
}

class _TrackingMapState extends State<TrackingMap> {

  late GoogleMapController _mapController;

  LatLng? _selectedLocation;

   static const LatLng _initialPosition = LatLng( 24.7136,  46.6753);


  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      child: Expanded(
        child: Stack(
          children: [
             Container(
                height: 275.h,
                child: GoogleMap(
                  onMapCreated: (controller) => _mapController = controller,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 10.0,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                ),
              ),
          ],
        )
         ),
    );
  }
}