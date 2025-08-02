import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/tracking_map.dart';
import 'package:shella_design/features/product/widgets/images/image_circle.dart';
    
class HeaderOfLookingDriver extends StatefulWidget {

  const HeaderOfLookingDriver({ Key? key }) : super(key: key);

  @override
  State<HeaderOfLookingDriver> createState() => _HeaderOfLookingDriverState();
}

class _HeaderOfLookingDriverState extends State<HeaderOfLookingDriver> {
  
  late GoogleMapController _mapController;

  LatLng? _selectedLocation;

   static const LatLng _initialPosition = LatLng( 24.7136,  46.6753);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Positioned.fill(
                  top: 0,
                  left: 0,
                  child:  GoogleMap(
                  onMapCreated: (controller) => _mapController = controller,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 10.0,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                ),
                  ),
            
                  Positioned(
                    top: 80.h,
                    left: 90.w,
                    child: ClipOval(
                      child: Container(
                        width: 200.w,
                        height: 200.h,
                        color: AppColors.gryColor_12,))),
            
                         Positioned(
                          top: 130.h,
                          left: 140.w,
                           child: ClipOval(
                            child: Container(
                              width: 100.w,
                              height: 100.h,
                              color: AppColors.wtColor,
                              child: Center(
                               child: custom_Images_asset(image: AppImages.subwayLocation,h: 41,w:41)
                              ),
                            ),
                                                   ),
                         ),
                      
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.gryColor_12,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(6),
                topRight: Radius.circular(6))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custom_Text(context,text: MainAppConstants.driversShowOrder,style: font14Primary600W(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(child: Container(
                        width: 32,
                        height: 32,
                        child: custom_Images_asset(image: AppImages.man),
                      )),
                       ClipOval(child: Container(
                        width: 32,
                        height: 32,
                        child: custom_Images_asset(image: AppImages.man),
                      )),
                        ClipOval(child: Container(
                        width: 32,
                        height: 32,
                        child: custom_Images_asset(image: AppImages.man),
                      ))
                    ],
                  )
                ],
              ),

            )
            )
        ],
      ),

    );
  }
}