import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/features/address/controllers/address_controller.dart';
import 'package:shella_design/features/address/domain/models/address_model.dart';
import 'package:shella_design/features/address/screens/mobile/full_screen_map.dart';
import 'package:shella_design/features/address/widgets/mobile/green_appbar.dart';
import 'package:shella_design/features/address/widgets/mobile/location_tag.dart';
import 'package:shella_design/features/address/widgets/mobile/text_field.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class AddNewAddressScreen extends StatefulWidget {
  final Address? address;

  const AddNewAddressScreen({super.key, this.address});

  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController houseController = TextEditingController();

  // للتحقق من صحة الحقول
  final _formKey = GlobalKey<FormState>();
  String? addressError;
  String? nameError;
  String? phoneError;

  // خريطة Google Maps
  final Completer<GoogleMapController> _mapController = Completer();
  static const LatLng _defaultLocation =
      LatLng(24.7136, 46.6753); // الرياض كموقع افتراضي
  final Set<Marker> _markers = {};
  LatLng _currentLocation = _defaultLocation;
  bool _isLoading = true;
  bool _isEditMode = false;
  bool _isSuccessHandled = false;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.address != null;

    // إعادة تعيين حالة العنوان عند فتح الصفحة لمنع التوجيه التلقائي
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final addressController = context.read<AddressController>();
        // إعادة تعيين حالة العنوان عند بدء الشاشة
        if (addressController.addressState == RequestState.success) {
          addressController.resetAddressState();
        }
      } catch (e) {
        print('Error accessing AddressController: $e');
      }
    });

    // Initialize form fields if editing an existing address
    if (_isEditMode) {
      // Set the form fields with the address data
      addressController.text = widget.address!.address;
      nameController.text = widget.address!.contactPersonName;
      phoneController.text = widget.address!.contactPersonNumber;
      streetController.text = widget.address!.road ?? '';
      floorController.text = widget.address!.floor ?? '';
      houseController.text = widget.address!.house ?? '';

      // Set the address type in the controller (will be done after getCurrentLocation)
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

      // Set the location
      if (widget.address!.latitude != null &&
          widget.address!.longitude != null) {
        _currentLocation = LatLng(
            double.parse(widget.address!.latitude.toString()),
            double.parse(widget.address!.longitude.toString()));
        _markers.add(
          Marker(
            markerId: const MarkerId('savedLocation'),
            position: _currentLocation,
            infoWindow: const InfoWindow(title: 'الموقع المحفوظ'),
            draggable: true,
            onDragEnd: (newPosition) {
              setState(() {
                _currentLocation = newPosition;
                _updateMarkerPosition(newPosition);
              });
            },
          ),
        );
        _isLoading = false;
      } else {
        _getCurrentLocation();
      }
    } else {
      _getCurrentLocation();
    }
  }

  // التحقق من صحة الحقول
  bool validateFields() {
    bool isValid = true;

    // التحقق من عنوان التسليم
    if (addressController.text.isEmpty) {
      setState(() {
        addressError = "يرجى إدخال عنوان التسليم";
      });
      isValid = false;
    } else {
      setState(() {
        addressError = null;
      });
    }

    // التحقق من اسم المتصل
    if (nameController.text.isEmpty) {
      setState(() {
        nameError = "يرجى إدخال اسم المتصل";
      });
      isValid = false;
    } else {
      setState(() {
        nameError = null;
      });
    }

    // التحقق من رقم الهاتف
    if (phoneController.text.isEmpty) {
      setState(() {
        phoneError = "يرجى إدخال رقم الهاتف";
      });
      isValid = false;
    } else if (phoneController.text.length < 9) {
      setState(() {
        phoneError = "رقم الهاتف غير صحيح";
      });
      isValid = false;
    } else {
      setState(() {
        phoneError = null;
      });
    }

    return isValid;
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // التحقق من تمكين خدمات الموقع
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // التحقق من أذونات الموقع
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _isLoading = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // الحصول على الموقع الحالي
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _markers.add(
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: _currentLocation,
            infoWindow: const InfoWindow(title: 'موقعك الحالي'),
            draggable: true,
            onDragEnd: (newPosition) {
              setState(() {
                _currentLocation = newPosition;
                _updateMarkerPosition(newPosition);
              });
            },
          ),
        );
        _isLoading = false;
      });

      // تحريك الكاميرا إلى الموقع الحالي
      final GoogleMapController controller = await _mapController.future;
      await controller
          .animateCamera(CameraUpdate.newLatLngZoom(_currentLocation, 14));
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('خطأ في الحصول على الموقع: $e');
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
      _currentLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height / 15),
        child: GreenAppBar(
          text: _isEditMode ? "تعديل العنوان الحالي" : "أضف عنواناً جديداً",
          icon: Icons.location_on,
        ),
      ),
      body: Selector<AddressController, RequestState>(
        selector: (_, controller) => controller.addressState,
        builder: (context, addressState, child) {
          if (addressState == RequestState.loading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (addressState == RequestState.error) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      context.read<AddressController>().errorMessage ??
                          'Request Failed'),
                ),
              );
            });
          }
          if (addressState == RequestState.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // إنشاء متغير للتتبع إذا تم عرض رسالة النجاح بالفعل
              if (!_isSuccessHandled) {
                _isSuccessHandled = true; // تعيين العلامة لتجنب التكرار

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_isEditMode
                        ? 'تم تحديث العنوان بنجاح'
                        : 'تم إضافة العنوان بنجاح'),
                    backgroundColor: AppColors.primaryColor,
                  ),
                );

                // العودة للشاشة السابقة في حالة التعديل، والانتقال إلى صفحة العناوين في حالة الإضافة
                if (_isEditMode) {
                  Navigator.of(context).pop(true); // العودة مع نتيجة نجاح
                } else {
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.addressDetails);
                }
              }
            });
          }
          return child!;
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(
                  _isEditMode ? "تعديل العنوان الحالي" : "أضف عنواناً جديداً",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.h),
                // Map Container
                Container(
                  height: size.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.orange, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Stack(
                      children: [
                        _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: _currentLocation,
                                  zoom: 14.0,
                                ),
                                markers: _markers,
                                mapType: MapType.normal,
                                myLocationEnabled: true,
                                compassEnabled: true,
                                zoomControlsEnabled: false,
                                onMapCreated: (GoogleMapController controller) {
                                  _mapController.complete(controller);
                                },
                                onTap: (position) {
                                  _updateMarkerPosition(position);
                                },
                              ),
                        Positioned(
                          bottom: 10,
                          left: 10,
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
                              icon: Icon(
                                Icons.fullscreen,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FullScreenMapPage(
                                      initialLocation: _currentLocation,
                                      markers: _markers,
                                      onLocationSelected: (position, address) {
                                        setState(() {
                                          _currentLocation = position;
                                          _updateMarkerPosition(position);
                                          addressController.text = address;
                                          addressError =
                                              null; // إزالة الخطأ عند تحديد العنوان
                                        });
                                      },
                                    ),
                                  ),
                                );

                                if (result != null &&
                                    result is Map<String, dynamic>) {
                                  setState(() {
                                    _currentLocation =
                                        result['location'] as LatLng;
                                    _updateMarkerPosition(_currentLocation);
                                    addressController.text =
                                        result['address'] as String;
                                    addressError =
                                        null; // إزالة الخطأ عند تحديد العنوان
                                  });
                                }
                              },
                              tooltip: 'عرض الخريطة بملء الشاشة',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    "أضف الموقع بشكل صحيح",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Consumer<AddressController>(
                  builder: (context, controller, _) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تسمية الموقع",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.updateAddressType(1);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60.w,
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                    color: controller.addressType == 1
                                        ? AppColors.primaryColor
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/svg/home-address.svg',
                                      height: 30,
                                      width: 30,
                                      color: controller.addressType == 1
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "منزل",
                                  style: TextStyle(
                                    color: controller.addressType == 1
                                        ? AppColors.primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.updateAddressType(2);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60.w,
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                    color: controller.addressType == 2
                                        ? AppColors.primaryColor
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/svg/job-address.svg',
                                      height: 30,
                                      width: 30,
                                      color: controller.addressType == 2
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "عمل",
                                  style: TextStyle(
                                    color: controller.addressType == 2
                                        ? AppColors.primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.updateAddressType(3);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60.w,
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                    color: controller.addressType == 3
                                        ? AppColors.primaryColor
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/svg/add-address.svg',
                                      height: 30,
                                      width: 30,
                                      color: controller.addressType == 3
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "أخرى",
                                  style: TextStyle(
                                    color: controller.addressType == 3
                                        ? AppColors.primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      // عنوان التسليم
                      Text(
                        "عنوان التسليم",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          hintText: "الرياض, السعودية",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: addressError != null
                                    ? Colors.red
                                    : Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: addressError != null
                                    ? Colors.red
                                    : AppColors.primaryColor),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          errorText: addressError,
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: addressError != null
                                ? Colors.red
                                : AppColors.primaryColor,
                          ),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 15.h),
                      // اسم الاتصال
                      Text(
                        "اسم الاتصال",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "ناصر",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: nameError != null
                                    ? Colors.red
                                    : Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: nameError != null
                                    ? Colors.red
                                    : AppColors.primaryColor),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          errorText: nameError,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: nameError != null
                                ? Colors.red
                                : AppColors.primaryColor,
                          ),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 15.h),
                      // رقم الهاتف
                      Text(
                        "رقم الهاتف",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomPhoneInput(
                        controller: phoneController,
                        onChanged: (number) {
                          // إذا تم تغيير رقم الهاتف، نزيل رسالة الخطأ
                          if (phoneError != null) {
                            setState(() {
                              phoneError = null;
                            });
                          }
                        },
                        errorText: phoneError,
                      ),
                      SizedBox(height: 15.h),
                      // اسم الشارع
                      Text(
                        "اسم الشارع",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: streetController,
                        decoration: InputDecoration(
                          hintText: "اسم الشارع (اختياري)",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.primaryColor),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          prefixIcon: Icon(
                            Icons.signpost_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 15.h),
                      // المنزل والأرضية
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: houseController,
                                  decoration: InputDecoration(
                                    hintText: "المنزل (اختياري)",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    prefixIcon: Icon(
                                      Icons.home_outlined,
                                      color: AppColors.primaryColor,
                                      size: 22,
                                    ),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: floorController,
                                  decoration: InputDecoration(
                                    hintText: "أرضية (اختياري)",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    prefixIcon: Icon(
                                      Icons.layers_outlined,
                                      color: AppColors.primaryColor,
                                      size: 22,
                                    ),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      // زر الحفظ
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {
                            if (validateFields()) {
                              if (_isEditMode) {
                                // Update existing address
                                controller.updateAddress(
                                  Address(
                                    id: widget
                                        .address!.id, // Keep the existing ID
                                    addressType: (controller.addressType == 1)
                                        ? 'منزل'
                                        : (controller.addressType == 2)
                                            ? 'عمل'
                                            : 'أخرى',
                                    contactPersonName: nameController.text,
                                    contactPersonNumber: phoneController.text,
                                    address: addressController.text,
                                    latitude: _currentLocation.latitude,
                                    longitude: _currentLocation.longitude,
                                    userId: widget.address!.userId,
                                    createdAt: widget.address!.createdAt,
                                    updatedAt: DateTime.now(),
                                    zoneId: widget.address!.zoneId,
                                    zoneIds: widget.address!.zoneIds,
                                    floor: floorController.text,
                                    road: streetController.text,
                                    house: houseController.text,
                                  ),
                                );
                              } else {
                                // Add new address
                                controller.addAddress(
                                  Address(
                                    id: 0,
                                    addressType: (controller.addressType == 1)
                                        ? 'منزل'
                                        : (controller.addressType == 2)
                                            ? 'عمل'
                                            : 'أخرى',
                                    contactPersonName: nameController.text,
                                    contactPersonNumber: phoneController.text,
                                    address: addressController.text,
                                    latitude: _currentLocation.latitude,
                                    longitude: _currentLocation.longitude,
                                    userId: 0,
                                    createdAt: DateTime.now(),
                                    updatedAt: DateTime.now(),
                                    zoneId: 1,
                                    zoneIds: [],
                                    floor: floorController.text,
                                    road: streetController.text,
                                    house: houseController.text,
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('يرجى إدخال جميع البيانات المطلوبة'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            _isEditMode ? "تحديث العنوان" : "حفظ العنوان",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
