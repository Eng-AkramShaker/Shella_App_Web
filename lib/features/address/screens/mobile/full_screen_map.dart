import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FullScreenMapPage extends StatefulWidget {
  final LatLng initialLocation;
  final Set<Marker> markers;
  final Function(LatLng, String)? onLocationSelected;

  const FullScreenMapPage({
    super.key,
    required this.initialLocation,
    required this.markers,
    this.onLocationSelected,
  });

  @override
  State<FullScreenMapPage> createState() => _FullScreenMapPageState();
}

class _FullScreenMapPageState extends State<FullScreenMapPage> {
  final Completer<GoogleMapController> _mapController = Completer();
  late Set<Marker> _markers;
  late LatLng _currentLocation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _markers = Set<Marker>.from(widget.markers);
    _currentLocation = widget.initialLocation;
  }

  void _updateMarkerPosition(LatLng position) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('selectedLocation'),
          position: position,
          infoWindow: const InfoWindow(title: 'الموقع المحدد'),
          draggable: true,
          onDragEnd: (newPosition) {
            setState(() {
              _currentLocation = newPosition;
              _updateMarkerPosition(newPosition);
            });
          },
        ),
      );
      _currentLocation = position;
    });
  }

  Future<String> _getAddressFromLatLng(LatLng position) async {
    // For both web and mobile platforms, try to get the actual address
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks[0];
        List<String> addressParts = [];

        if (place.street != null && place.street!.isNotEmpty) {
          addressParts.add(place.street!);
        }
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          addressParts.add(place.subLocality!);
        }
        if (place.locality != null && place.locality!.isNotEmpty) {
          addressParts.add(place.locality!);
        }
        if (place.administrativeArea != null &&
            place.administrativeArea!.isNotEmpty) {
          addressParts.add(place.administrativeArea!);
        }
        if (place.country != null && place.country!.isNotEmpty) {
          addressParts.add(place.country!);
        }

        if (addressParts.isNotEmpty) {
          return addressParts.join(", ");
        }
      }
    } catch (e) {
      print('خطأ في الحصول على العنوان: $e');
    }

    // If geocoding fails, provide a natural location description without coordinates
    return 'موقع محدد في الخريطة';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'الخريطة',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.initialLocation,
              zoom: 14.0,
            ),
            markers: _markers,
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
            onTap: (position) {
              _updateMarkerPosition(position);
            },
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() {
                        _isLoading = true;
                      });

                      final String address =
                          await _getAddressFromLatLng(_currentLocation);

                      setState(() {
                        _isLoading = false;
                      });

                      if (widget.onLocationSelected != null) {
                        widget.onLocationSelected!(_currentLocation, address);
                      }
                      Navigator.pop(context, {
                        'location': _currentLocation,
                        'address': address,
                      });
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBackgroundColor:
                    AppColors.primaryColor.withOpacity(0.5),
              ),
              child: _isLoading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      'تحديد هذا العنوان',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
