import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/features/profile_detailes/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/features/profile_detailes/widgets/greanappbar.dart';
import 'package:shella_design/features/profile_detailes/widgets/locationTag.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_loading.dart';
import 'package:shella_design/features/profile_detailes/widgets/selectableButton.dart';
import 'package:shella_design/features/profile_detailes/widgets/textField.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';

class AddNewAddressScreen extends StatefulWidget {
  final Address? editAddress;

  const AddNewAddressScreen({super.key, this.editAddress});

  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  Address? editAddress;
  final TextEditingController adressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  LatLng? selectedLocation;

  // late GoogleMapController mapController;
  // Set<Marker> markers = {};
  // CameraPosition? initialCameraPosition;
  // bool _loadingLocation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = context.read<ProfileController>();
      controller.resetOperationState();

      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is Address) {
        _initializeForm(args);
      } else {
        selectedLocation = const LatLng(24.7136, 46.6753);
      }
    });
  }

  void _initializeForm(Address address) {
    final controller = context.read<ProfileController>();

    adressController.text = address.address;
    phoneController.text = address.contactPersonNumber;
    nameController.text = address.contactPersonName;
    streetController.text = address.road ?? '';

    double? lat = double.tryParse(address.latitude);
    double? lng = double.tryParse(address.longitude);
    if (lat != null && lng != null) {
      selectedLocation = LatLng(lat, lng);
    }

    // Set type
    if (address.addressType == 'عمل') {
      controller.updateTybe(2);
    } else if (address.addressType == 'إضافة') {
      controller.updateTybe(3);
    } else {
      controller.updateTybe(1);
    }

    // Set floor
    controller.updatefloor(address.floor == 'أرضية' ? 2 : 1);
  }

  @override
  void dispose() {
    adressController.dispose();
    phoneController.dispose();
    nameController.dispose();
    streetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height / 15),
        child: GreanAppBar(
          text:
              widget.editAddress != null ? "تعديل العنوان" : "إضافة عنوان جديد",
          icon: Icons.location_on,
        ),
      ),
      body: Selector<ProfileController, RequestState>(
        selector: (_, controller) => controller.adressstate,
        builder: (context, adressState, child) {
          if (adressState == RequestState.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<ProfileController>().resetOperationState();
              pushReplacementNamedRoute(context, AppRoutes.addressDetails);
            });
            return const Center(
                child: ProfileLoading(color: AppColors.primaryColor));
          }
          if (adressState == RequestState.loading) {
            return const Center(
              child: ProfileLoading(color: AppColors.primaryColor),
            );
          }
          if (adressState == RequestState.error) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final error = context.read<ProfileController>().errorMessage;
              if (error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error)),
                );
                context.read<ProfileController>().resetAddState();
              }
            });
          }

          return child!;
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "أضف عنوانًا جديدًا",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              // Container(
              //   height: size.height / 4,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.green, width: 2.w),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(10),
              //     child: GoogleMap(
              //       initialCameraPosition: CameraPosition(
              //         target:
              //             selectedLocation ?? const LatLng(24.7136, 46.6753),
              //         zoom: 14.0,
              //       ),
              //       // onMapCreated: (controller) {
              //       //   mapController = controller;
              //       // },
              //       onMapCreated: _onMapCreated,
              //       markers: markers,
              //       myLocationEnabled: true,
              //       myLocationButtonEnabled: true,
              //       compassEnabled: true,
              //       mapType: MapType.normal,
              //       onTap: _onMapTapped,
              //
              //       // onTap: (LatLng latLng) {
              //       //   setState(() {
              //       //     selectedLocation = latLng;
              //       //     markers = {
              //       //       Marker(
              //       //         markerId: MarkerId('selected-location'),
              //       //         position: latLng,
              //       //       ),
              //       //     };
              //       //   });
              //       // },
              //     ),
              //   ),
              // ),
              SizedBox(height: 10.h),
              Consumer<ProfileController>(
                builder: (context, controller, _) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("تسمية الموقع",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<ProfileController>().updateTybe(1);
                          },
                          child: locationTag(
                            icon: Icons.home,
                            label: "منزل",
                            color: (controller.tybe == 1)
                                ? AppColors.primaryColor
                                : AppColors.darkGreyColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            context.read<ProfileController>().updateTybe(2);
                          },
                          child: locationTag(
                            icon: Icons.work,
                            label: "عمل",
                            color: (controller.tybe == 2)
                                ? AppColors.primaryColor
                                : AppColors.darkGreyColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            context.read<ProfileController>().updateTybe(3);
                          },
                          child: locationTag(
                            icon: Icons.add,
                            label: "إضافة",
                            color: (controller.tybe == 3)
                                ? AppColors.primaryColor
                                : AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    textField(
                      label: "عنوان التسليم",
                      hint: "الرياض , السعودية",
                      controller: adressController,
                    ),
                    SizedBox(height: 10),
                    textField(
                      label: "اسم الاتصال",
                      hint: "ناصر",
                      controller: nameController,
                    ),
                    SizedBox(height: 10),
                    const Text(
                      "رقم الهاتف",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomPhoneInput(
                      controller: phoneController,
                      onChanged: (number) {},
                    ),
                    SizedBox(height: 10),
                    textField(
                      label: "اسم الشارع (اختياري)",
                      controller: streetController,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<ProfileController>().updatefloor(1);
                          },
                          child: selectableButton(
                            "منزل (اختياري)",
                            (controller.floor == 1)
                                ? AppColors.greenColor
                                : AppColors.darkGreyColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            context.read<ProfileController>().updatefloor(2);
                          },
                          child: selectableButton(
                            "أرضية (اختياري)",
                            (controller.floor == 2)
                                ? AppColors.greenColor
                                : AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (nameController.text.isEmpty ||
                            phoneController.text.isEmpty ||
                            adressController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('يرجى ملء جميع الحقول المطلوبة')),
                          );
                          return;
                        }
                        if (selectedLocation == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('يرجى تحديد الموقع على الخريطة')),
                          );
                          return;
                        }
                        final addressType = controller.tybe == 1
                            ? 'منزل'
                            : controller.tybe == 2
                                ? 'عمل'
                                : 'أخرى';

                        final address = Address(
                          id: widget.editAddress?.id ?? 0,
                          addressType: addressType,
                          contactPersonName: nameController.text,
                          contactPersonNumber: phoneController.text,
                          address: adressController.text,
                          latitude: selectedLocation!.latitude.toString(),
                          longitude: selectedLocation!.longitude.toString(),
                          userId: widget.editAddress?.userId ?? 0,
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                          zoneId: 1,
                          zoneIds: [],
                          floor: controller.floor == 1 ? 'منزل' : 'أرضية',
                          road: streetController.text,
                        );

                        // controller.addAddress(
                        //   Address(
                        //     id: widget.editAddress?.id ?? 0,
                        //     addressType: addressType,
                        //     contactPersonName: nameController.text,
                        //     contactPersonNumber: phoneController.text,
                        //     address: adressController.text,
                        //     latitude: selectedLocation!.latitude.toString(),
                        //     longitude: selectedLocation!.longitude.toString(),
                        //     userId: widget.editAddress?.userId ?? 0,
                        //     createdAt: DateTime.now(),
                        //     updatedAt: DateTime.now(),
                        //     zoneId: 1,
                        //     zoneIds: [],
                        //     floor: controller.floor == 1 ? 'منزل' : 'أرضية',
                        //     road: streetController.text,
                        //   ),
                        // );
                        if (widget.editAddress != null) {
                          controller.updateAddress(address); // Update existing
                        } else {
                          controller.addAddress(address); // Create new
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                          widget.editAddress != null
                              ? "تحديث العنوان" // Update Address
                              : "حفظ العنوان",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// GoogleMap(
//                   initialCameraPosition: CameraPosition(
//                     target: selectedLocation!,
//                     zoom: 16.0,
//                   ),
//                   minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
//                   onMapCreated: (controller) {
//                     mapController = controller;
//                     setState(() {
//                       markers.add(
//                         Marker(
//                           markerId: const MarkerId('selectedLocation'),
//                           position: selectedLocation!,
//                         ),
//                       );
//                     });
//                   },
//                   markers: markers,
//                   onTap: (LatLng location) {
//                     setState(() {
//                       selectedLocation = location;
//                       markers.clear();
//                       markers.add(
//                         Marker(
//                           markerId: const MarkerId('selectedLocation'),
//                           position: location,
//                         ),
//                       );
//                     });
//                   },
//                   myLocationEnabled: true,
//                   myLocationButtonEnabled: true,
//                 )
//////////
// if (widget.editAddress != null) {
//   double? lat = double.tryParse(widget.editAddress!.latitude);
//   double? lng = double.tryParse(widget.editAddress!.longitude);
//   if (lat != null && lng != null) {
//     selectedLocation = LatLng(lat, lng);
//     initialCameraPosition = CameraPosition(
//       target: selectedLocation!,
//       zoom: 14.0,
//     );
//   }
// } else {
//   // selectedLocation = const LatLng(24.7136, 46.6753); // Default location
//   // initialCameraPosition = CameraPosition(
//   //   target: selectedLocation!,
//   //   zoom: 14.0,
//   // );
//   _getCurrentLocation();
// }

// Future<void> _getCurrentLocation() async {
//   setState(() => _loadingLocation = true);
//
//   try {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//
//     setState(() {
//       selectedLocation = LatLng(position.latitude, position.longitude);
//       initialCameraPosition = CameraPosition(
//         target: selectedLocation!,
//         zoom: 14.0,
//       );
//     });
//   } catch (e) {
//     print("Error getting location: $e");
//     // Fallback to default location
//     selectedLocation = const LatLng(24.7136, 46.6753);
//     initialCameraPosition = CameraPosition(
//       target: selectedLocation!,
//       zoom: 14.0,
//     );
//   } finally {
//     setState(() => _loadingLocation = false);
//   }
// }
// void _setInitialSelections(Address address, ProfileController controller) {
//   // Set type
//   if (address.addressType == 'عمل') {
//     controller.updateTybe(2);
//   } else if (address.addressType == 'إضافة') {
//     controller.updateTybe(3);
//   } else {
//     controller.updateTybe(1);
//   }
//
//   // Set floor
//   controller.updatefloor(address.floor == 'أرضية' ? 2 : 1);
// }
//
// void _onMapCreated(GoogleMapController controller) {
//   mapController = controller;
//   _updateMarker();
// }
//
// void _onMapTapped(LatLng location) {
//   setState(() {
//     selectedLocation = location;
//     _updateMarker();
//   });
// }

// void _updateMarker() {
//   if (selectedLocation != null) {
//     markers.clear();
//     markers.add(
//       Marker(
//         markerId: const MarkerId('selectedLocation'),
//         position: selectedLocation!,
//         infoWindow: const InfoWindow(title: 'موقع التسليم'),
//       ),
//     );
//   }
// }
//
// void _goToCurrentLocation() async {
//   setState(() => _loadingLocation = true);
//   try {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//
//     mapController.animateCamera(CameraUpdate.newCameraPosition(
//       CameraPosition(
//         target: LatLng(position.latitude, position.longitude),
//         zoom: 14.0,
//       ),
//     ));
//
//     setState(() {
//       selectedLocation = LatLng(position.latitude, position.longitude);
//       _updateMarker();
//     });
//   } catch (e) {
//     print("Error getting location: $e");
//   } finally {
//     setState(() => _loadingLocation = false);
//   }
// }
