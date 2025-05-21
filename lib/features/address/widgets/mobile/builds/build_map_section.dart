import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget buildMapSection({
  required BuildContext context,
  required Completer<GoogleMapController> mapController,
  required Set<Marker> markers,
  required LatLng currentLocation,
  required Function(LatLng) onLocationChanged,
  required VoidCallback onFullScreenPressed,
  required bool isLoading,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'اختر الموقع على الخريطة',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: 8.h),
      Container(
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.gryColor_3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Stack(
            children: [
              // Google Map
              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentLocation,
                    zoom: 14,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController.complete(controller);
                  },
                  markers: markers,
                  onTap: (position) {
                    onLocationChanged(position);
                  },
                  myLocationEnabled: true,
                ),

              // Fullscreen button
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onFullScreenPressed,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(Icons.fullscreen, size: 20.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
