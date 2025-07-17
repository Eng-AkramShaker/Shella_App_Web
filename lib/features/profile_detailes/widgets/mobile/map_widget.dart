import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';

import '../../controllers/map_controller.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MapController>(
      builder: (context, mapController, child) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.primaryColor, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: mapController.selectedLocation ??
                        const LatLng(24.7136, 46.6753),
                    zoom: mapController.zoomLevel,
                  ),
                  onMapCreated: mapController.onMapCreated,
                  onTap: (location) {
                    mapController.setSelectedLocation(location);
                  },
                  markers: {
                    if (mapController.selectedLocation != null)
                      Marker(
                        markerId: const MarkerId('selected_location'),
                        position: mapController.selectedLocation!,
                      ),
                  },
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              left: 10.w,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'location_btn_${UniqueKey()}',
                    backgroundColor: Colors.white,
                    onPressed: () async {
                      try {
                        await mapController.getCurrentLocation();
                        if (mapController.selectedLocation != null) {
                          // onLocationSelected(mapController.selectedLocation!);
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    },
                    child: const Icon(Icons.my_location,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(height: 10.h),
                  FloatingActionButton.small(
                    heroTag: 'pin_btn_${UniqueKey()}',
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      mapController.pinCurrentLocation();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم تثبيت الموقع بنجاح')),
                      );
                    },
                    child: const Icon(Icons.location_pin, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10.h,
              right: 10.w,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'zoom_in_btn_${UniqueKey()}',
                    backgroundColor: Colors.white,
                    onPressed: mapController.zoomIn,
                    child: const Icon(Icons.add, color: AppColors.primaryColor),
                  ),
                  SizedBox(height: 10.h),
                  FloatingActionButton.small(
                    heroTag: 'zoom_out_btn_${UniqueKey()}',
                    backgroundColor: Colors.white,
                    onPressed: mapController.zoomOut,
                    child:
                        const Icon(Icons.remove, color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
