import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class GoogleMapsLocationPicker extends StatefulWidget {
  TextEditingController addressController;
  GoogleMapsLocationPicker({required this.addressController});
  @override
  _GoogleMapsLocationPickerState createState() => _GoogleMapsLocationPickerState();
}

class _GoogleMapsLocationPickerState extends State<GoogleMapsLocationPicker> {
  late GoogleMapController _mapController;
 // late TextEditingController _addresscontroller;
  LatLng? _selectedLocation;
  String _locationInfo = 'Tap on the map ';
  String _street='street';
  bool _isLoading = false;

  // Default location (New York)
 // static const LatLng _initialPosition = LatLng(40.7128, -74.0060);

   // Default location  (saudia arabia)
 static const LatLng _initialPosition = LatLng( 24.7136,  46.6753);

  // Map markers
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
 //   _getCurrentLocation();
  }

  

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoading = true);
    
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition();
      _goToLocation(LatLng(position.latitude, position.longitude));
      await _updateLocationInfo(LatLng(position.latitude, position.longitude));
    } catch (e) {
      print("Error getting location: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _goToLocation(LatLng location) {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: 14.0,
        ),
      ),
    );
  }

  Future<void> _updateLocationInfo(LatLng location) async {
    setState(() {
      _isLoading = true;
      _selectedLocation = location;
    });

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
         
// Country: ${place.country ?? 'N/A'}
// City: ${place.locality ?? place.subAdministrativeArea ?? 'N/A'}

          _locationInfo= "${place.country ?? ''} ,${place.locality ?? place.street ?? ''} , ${location.latitude.toStringAsFixed(6)} ,  ${location.longitude.toStringAsFixed(6)}";
           widget.addressController.text= _locationInfo;
           _street=place.street ?? '';
        });
      }

      // Update marker
      _markers.clear();

      final BitmapDescriptor greenCircleIcon = await BitmapDescriptor.fromAssetImage(
  const ImageConfiguration(size: Size(48, 48)),
  AppImages.greenMarker, // Your custom green circle image
);
      _markers.add(
        // Marker(
        //   markerId: MarkerId('selected-location'),
        //   position: location,
        //   infoWindow: InfoWindow(title: 'Selected Location'),
        //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        // ),

        Marker(
  markerId: MarkerId('green_circle_marker'),
  position: location,
  icon: greenCircleIcon, // Use your custom icon
  consumeTapEvents: true,
   )
      );
    } catch (e) {
      setState(() {
        _locationInfo = 'Error getting address: ${e.toString()}';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 250,
    
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                height: 185.h,
                child: GoogleMap(
                  onMapCreated: (controller) => _mapController = controller,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 10.0,
                  ),
                  markers: _markers,
                  onTap: (LatLng location) {
                    _updateLocationInfo(location);
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                ),
              ),

              Positioned(
                top:25,
                left: 100,
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                 color: AppColors.primaryColor,
                 borderRadius: BorderRadius.circular(16)

                ),
                height: 40,
                width: 120,
                child: Center(child: Custom_Text(context, text: _street
                ,style: font11White400W(context))),
              ),
            )
               )
              
              
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical:6.h,horizontal: 2),
              color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             
                SizedBox(height: 10),
               Directionality(
                      textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 44,
                  child: TextFormField(
                   cursorColor: AppColors.greenColor,
                   decoration: InputDecoration(
                    labelText: MainAppConstants.house,
                    prefixIcon: Image(image: AssetImage(AppImages.houseIcon)),
                    contentPadding: EdgeInsets.symmetric(
                 vertical: 5, horizontal: 5),
                 enabledBorder: 
                 OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular( 8.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                      width: 1)),
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                    color: AppColors.greenColor,
                    width: 1)),
                    border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                    width:1,
                    )),

                   ),
                     readOnly: true,
                    style: TextStyle(fontSize: 10,color: AppColors.bgColor),
                    controller: widget.addressController)
                    )
                ),
   
                SizedBox(height: 10),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}