import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/address/controllers/address_controller.dart';
import 'package:shella_design/features/address/domain/repositories/address_repo.dart';
import 'package:shella_design/features/address/domain/repositories/address_repository_interface.dart';
import 'package:shella_design/features/address/domain/services/address_service.dart';
import 'package:shella_design/features/address/domain/services/address_service_interface.dart';
import 'package:shella_design/features/address/screens/mobile/add_new_address.dart';
import 'package:shella_design/features/address/screens/mobile/full_screen_map.dart';
import 'package:shella_design/features/address/widgets/mobile/address_card.dart';
import 'package:shella_design/features/address/widgets/mobile/green_appbar.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/dialog/confirmation_dialog.dart';

class AddressDetailsPage extends StatefulWidget {
  const AddressDetailsPage({super.key});

  @override
  State<AddressDetailsPage> createState() => _AddressDetailsPageState();
}

class _AddressDetailsPageState extends State<AddressDetailsPage> {
  final Completer<GoogleMapController> _mapController = Completer();
  static const LatLng _defaultLocation =
      LatLng(24.7136, 46.6753); // Riyadh default
  final Set<Marker> _markers = {};
  LatLng _currentLocation = _defaultLocation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }

      // Check location permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return;
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _markers.add(
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: _currentLocation,
            infoWindow: const InfoWindow(title: 'موقعك الحالي'),
          ),
        );
        _isLoading = false;
      });

      // Move camera to current location
      final GoogleMapController controller = await _mapController.future;
      await controller
          .animateCamera(CameraUpdate.newLatLngZoom(_currentLocation, 14));
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(80, size.height / 15),
        child: GreenAppBar(
          text: 'عناويني',
          icon: Icons.location_on,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<AddressController>(
            builder: (context, controller, _) {
              if (controller.addressState == RequestState.initial) {
                controller.getAddresses();
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  ),
                );
              }

              if (controller.addressState == RequestState.loading) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  ),
                );
              }

              if (controller.addressState == RequestState.error) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text(controller.errorMessage ?? 'Request Failed'),
                    ),
                  );
                });
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.addresses?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final address = controller.addresses![index];
                    return AddressCard(
                      address: address,
                      isSelected: controller.isAddressSelected(address.id),
                      onTap: () {
                        controller.setSelectedAddress(address.id);
                      },
                      onEditPressed: () {
                        // Navigate to edit address screen with selected address
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddNewAddressScreen(address: address),
                          ),
                        ).then((_) {
                          // Refresh address list after editing
                          controller.getAddresses();
                          setState(() {});
                        });
                      },
                      onDeletePressed: () {
                        // Show confirmation dialog before deleting
                        showConfirmationDialog(
                          context: context,
                          title: 'تأكيد الحذف',
                          description:
                              'هل أنت متأكد من رغبتك في حذف هذا العنوان؟',
                          confirmButtonText: 'حذف',
                          cancelButtonText: 'إلغاء',
                          onConfirm: () {
                            controller.removeAddress(address.id.toString());
                          },
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
          buildMapWidget(size),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          pushNewScreen(
            context,
            AppRoutes.addNewAddress,
          );
        },
      ),
    );
  }

  Widget buildMapWidget(Size size) {
    return Stack(
      children: [
        Container(
          height: size.height / 3,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 2.w),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation,
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
                  ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.fullscreen, color: AppColors.primaryColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenMapPage(
                      initialLocation: _currentLocation,
                      markers: _markers,
                    ),
                  ),
                );
              },
              tooltip: 'عرض الخريطة بملء الشاشة',
            ),
          ),
        ),
      ],
    );
  }
}
