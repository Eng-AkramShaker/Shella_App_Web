import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/features/address/controllers/address_controller.dart';
import 'package:shella_design/features/address/domain/models/address_model.dart';
import 'package:shella_design/features/address/screens/mobile/full_screen_map.dart';
import 'package:shella_design/features/address/widgets/mobile/index.dart';

class AddNewAddressScreenOptimized extends StatefulWidget {
  final Address? address;

  const AddNewAddressScreenOptimized({super.key, this.address});

  @override
  _AddNewAddressScreenOptimizedState createState() =>
      _AddNewAddressScreenOptimizedState();
}

class _AddNewAddressScreenOptimizedState
    extends State<AddNewAddressScreenOptimized> {
  // Controllers
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController houseController = TextEditingController();

  // Form validation
  final _formKey = GlobalKey<FormState>();
  String? addressError;
  String? nameError;
  String? phoneError;

  // Map related variables
  final Completer<GoogleMapController> _mapController = Completer();
  static const LatLng _defaultLocation = LatLng(24.7136, 46.6753);
  final Set<Marker> _markers = {};
  LatLng _currentLocation = _defaultLocation;
  bool _isLoading = true;
  bool _isEditMode = false;
  bool _isSuccessHandled = false;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.address != null;

    // Reset address state when opening the page to prevent automatic navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final addressController = context.read<AddressController>();
        if (addressController.addressState == RequestState.success) {
          addressController.resetAddressState();
        }
      } catch (e) {
        print('Error accessing AddressController: $e');
      }
    });

    // Initialize form fields if editing an existing address
    if (_isEditMode) {
      _initializeFormWithExistingAddress();
    } else {
      _getCurrentLocation();
    }
  }

  void _initializeFormWithExistingAddress() {
    // Set form fields with address data
    addressController.text = widget.address!.address;
    nameController.text = widget.address!.contactPersonName;
    phoneController.text = widget.address!.contactPersonNumber;
    streetController.text = widget.address!.road ?? '';
    floorController.text = widget.address!.floor ?? '';
    houseController.text = widget.address!.house ?? '';

    // Set address type in controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final addressController = context.read<AddressController>();
        if (widget.address!.addressType == 'منزل') {
          addressController.updateAddressType(1);
        } else if (widget.address!.addressType == 'عمل') {
          addressController.updateAddressType(2);
        } else {
          addressController.updateAddressType(3);
        }
      } catch (e) {
        print('Error accessing AddressController: $e');
      }
    });

    // Set location
    if (widget.address!.latitude != null && widget.address!.longitude != null) {
      _currentLocation = LatLng(
        double.parse(widget.address!.latitude.toString()),
        double.parse(widget.address!.longitude.toString()),
      );
      _updateMarkerPosition(_currentLocation);
      _isLoading = false;
    } else {
      _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => _isLoading = false);
        return;
      }

      // Check location permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => _isLoading = false);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() => _isLoading = false);
        return;
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _updateMarkerPosition(_currentLocation);
        _isLoading = false;
      });

      // Move camera to current location
      final GoogleMapController controller = await _mapController.future;
      await controller.animateCamera(
        CameraUpdate.newLatLngZoom(_currentLocation, 14),
      );
    } catch (e) {
      setState(() => _isLoading = false);
      print('Error getting location: $e');
    }
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
    });
  }

  void _openFullScreenMap() async {
    final LatLng? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenMapPage(
          initialLocation: _currentLocation,
          markers: _markers,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _currentLocation = result;
        _updateMarkerPosition(result);
      });
    }
  }

  void _validateAndSubmit() {
    // Use our validation utility
    final validationResult = validateAddressFields(
      address: addressController.text,
      name: nameController.text,
      phone: phoneController.text,
    );

    setState(() {
      addressError = validationResult.addressError;
      nameError = validationResult.nameError;
      phoneError = validationResult.phoneError;
    });

    if (validationResult.isValid) {
      _submitAddress();
    }
  }

  void _submitAddress() {
    final controller = context.read<AddressController>();

    // Get address type string based on selected value
    String addressType = "منزل"; // Default
    if (controller.addressType == 2) {
      addressType = "عمل";
    } else if (controller.addressType == 3) {
      addressType = "أخرى";
    }

    // For the purpose of this example, we'll use dummy values for required fields
    // In a real implementation, these would come from the user's account or API
    final newAddress = Address(
      id: _isEditMode ? widget.address!.id : 0, // Use 0 for new addresses
      address: addressController.text,
      addressType: addressType,
      contactPersonName: nameController.text,
      contactPersonNumber: phoneController.text,
      latitude: _currentLocation.latitude.toString(),
      longitude: _currentLocation.longitude.toString(),
      road: streetController.text,
      floor: floorController.text,
      house: houseController.text,
      userId: 1, // Dummy value - should come from user session
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      zoneId: 1, // Dummy value - should come from API
      zoneIds: [1], // Dummy value - should come from API
    );

    if (_isEditMode) {
      controller.updateAddress(newAddress);
    } else {
      controller.addAddress(newAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          _isEditMode ? 'تعديل العنوان' : 'إضافة عنوان جديد',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<AddressController>(
        builder: (context, controller, child) {
          // Handle success and error states
          if (controller.addressState == RequestState.success &&
              controller.wasAddressActuallySubmitted &&
              !_isSuccessHandled) {
            // Set flag to prevent multiple redirects
            _isSuccessHandled = true;

            // Navigate back after successful submission
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Map Section
                  buildMapSection(
                    context: context,
                    mapController: _mapController,
                    markers: _markers,
                    currentLocation: _currentLocation,
                    onLocationChanged: (position) {
                      setState(() {
                        _currentLocation = position;
                        _updateMarkerPosition(position);
                      });
                    },
                    onFullScreenPressed: _openFullScreenMap,
                    isLoading: _isLoading,
                  ),
                  SizedBox(height: 24.h),

                  // Address Type Buttons
                  buildAddressTypeButtons(context),
                  SizedBox(height: 24.h),

                  // Form Fields
                  buildAddressFormFields(
                    context: context,
                    addressController: addressController,
                    nameController: nameController,
                    phoneController: phoneController,
                    streetController: streetController,
                    floorController: floorController,
                    houseController: houseController,
                    addressError: addressError,
                    nameError: nameError,
                    phoneError: phoneError,
                  ),

                  // Submit Button
                  AddressSubmitButton(
                    text: _isEditMode ? 'تحديث العنوان' : 'إضافة العنوان',
                    onPressed: _validateAndSubmit,
                    isLoading: controller.addressState == RequestState.loading,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
