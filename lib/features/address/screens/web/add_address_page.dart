import 'dart:async';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shella_design/features/address/controllers/address_controller.dart';
import 'package:shella_design/features/address/domain/models/address_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shella_design/features/address/screens/mobile/full_screen_map.dart';
import 'address_type_selector.dart';
import 'package:geocoding/geocoding.dart';

class AddAddressPage extends StatefulWidget {
  final Address? address;

  const AddAddressPage({super.key, this.address});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  int selectedAddressType = 0;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();

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

  // حالة العملية
  bool _isLoading = true;
  bool _isEditMode = false;
  bool _isSuccessHandled = false;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.address != null;
    _isSuccessHandled = false;

    // إذا كان في وضع التعديل، نملأ الحقول بالبيانات الموجودة
    if (_isEditMode) {
      _addressController.text = widget.address!.address;
      _nameController.text = widget.address!.contactPersonName;
      _phoneController.text = widget.address!.contactPersonNumber;
      _streetController.text = widget.address!.road ?? '';
      _floorController.text = widget.address!.floor ?? '';
      _houseController.text = widget.address!.house ?? '';

      // تعيين نوع العنوان
      WidgetsBinding.instance.addPostFrameCallback((_) {
        try {
          if (widget.address!.addressType == 'منزل') {
            setState(() => selectedAddressType = 0);
          } else if (widget.address!.addressType == 'عمل') {
            setState(() => selectedAddressType = 1);
          } else {
            setState(() => selectedAddressType = 2);
          }
        } catch (e) {
          print('Error setting address type: $e');
        }
      });

      // تعيين الموقع
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
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ),
        );
        _isLoading = false;
      } else {
        _getCurrentLocation();
      }
    } else {
      _getCurrentLocation();
    }

    // إعادة تعيين حالة العنوان عند فتح الصفحة لمنع التوجيه التلقائي
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final addressController = context.read<AddressController>();
        // Explicitly reset the address state to prevent immediate return
        addressController.resetAddressState();
      } catch (e) {
        print('Error accessing AddressController: $e');
      }
    });
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
      try {
        final position = await Geolocator.getCurrentPosition(
          timeLimit: const Duration(seconds: 5),
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          _currentLocation = LatLng(position.latitude, position.longitude);
          _markers.clear();
          _markers.add(
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: _currentLocation,
              infoWindow: const InfoWindow(title: 'موقعك الحالي'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
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

        // تحريك الكاميرا إلى الموقع الحالي إذا تم تهيئة الخريطة
        if (_mapController.isCompleted) {
          final GoogleMapController controller = await _mapController.future;
          controller
              .animateCamera(CameraUpdate.newLatLngZoom(_currentLocation, 14));
        }
      } catch (timeoutError) {
        // في حالة انتهاء مهلة الطلب، نستخدم الموقع الافتراضي
        setState(() {
          _markers.add(
            Marker(
              markerId: const MarkerId('defaultLocation'),
              position: _currentLocation,
              infoWindow: const InfoWindow(title: 'الموقع الافتراضي'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
            ),
          );
          _isLoading = false;
        });
        print('Timeout getting location, using default location');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
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
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          _isEditMode ? 'تعديل العنوان الحالي' : 'إضافة عنوان جديد',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildAddressForm(context),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressForm(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double formWidth = screenWidth > 1000 ? 950 : screenWidth * 0.9;

    return Form(
      key: _formKey,
      child: SizedBox(
        width: formWidth,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: AppColors.gryColor_3,
              width: 2.0,
            ),
          ),
          color: AppColors.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Selector<AddressController, RequestState>(
              selector: (_, controller) => controller.addressState,
              builder: (context, addressState, child) {
                if (addressState == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  );
                }

                if (addressState == RequestState.error) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            context.read<AddressController>().errorMessage ??
                                'فشل الطلب'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
                }

                if (addressState == RequestState.success) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!_isSuccessHandled) {
                      _isSuccessHandled = true;

                      // Don't navigate back immediately for a new form
                      // Only navigate back if this is a real submission
                      final addressController =
                          context.read<AddressController>();
                      bool wasActualSubmission =
                          addressController.wasAddressActuallySubmitted;

                      if (wasActualSubmission) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(_isEditMode
                                ? 'تم تحديث العنوان بنجاح'
                                : 'تم إضافة العنوان بنجاح'),
                            backgroundColor: AppColors.primaryColor,
                          ),
                        );
                        Navigator.pop(context, true);
                      } else {
                        // Just reset the state without navigating
                        addressController.resetAddressState();
                      }
                    }
                  });
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(context),
                    _buildMapPreview(),
                    _buildAddressHint(context),
                    _buildAddressTypeSelector(),
                    _buildFormFields(context),
                    _buildSubmitButton(context),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Custom_Text(
      context,
      text: _isEditMode ? "تعديل العنوان الحالي" : "اضف عنوانآ جديدآ",
      style: font11Black500W(context, size: 24),
    );
  }

  Widget _buildMapPreview() {
    double screenWidth = MediaQuery.of(context).size.width;
    double mapWidth = screenWidth > 1000 ? 950 : screenWidth * 0.9;

    return Stack(
      children: [
        Container(
          height: 350,
          width: mapWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.secondaryColor,
              width: 2.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: kIsWeb ? _buildWebMapView() : _buildNativeMapView(),
          ),
        ),
        // زر عرض الخريطة بملء الشاشة
        Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
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
                          _addressController.text = address;
                          addressError = null; // إزالة الخطأ عند تحديد العنوان
                        });
                      },
                    ),
                  ),
                );

                if (result != null && result is Map<String, dynamic>) {
                  setState(() {
                    _currentLocation = result['location'] as LatLng;
                    _updateMarkerPosition(_currentLocation);
                    _addressController.text = result['address'] as String;
                    addressError = null; // إزالة الخطأ عند تحديد العنوان
                  });
                }
              },
              tooltip: 'عرض الخريطة بملء الشاشة',
            ),
          ),
        ),
      ],
    );
  }

  // بناء عرض الخريطة للويب
  Widget _buildWebMapView() {
    try {
      return _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor))
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
                controller.animateCamera(
                    CameraUpdate.newLatLngZoom(_currentLocation, 14.0));
              },
              onTap: (position) async {
                _updateMarkerPosition(position);

                // Get address from the selected position
                try {
                  // Use the same method as in the mobile version
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenMapPage(
                        initialLocation: position,
                        markers: _markers,
                        onLocationSelected: (newPosition, address) {
                          _updateMarkerPosition(newPosition);
                          setState(() {
                            _addressController.text = address;
                            addressError = null;
                          });
                          return {
                            'location': newPosition,
                            'address': address,
                          };
                        },
                      ),
                    ),
                  );

                  if (result != null && result is Map<String, dynamic>) {
                    setState(() {
                      _currentLocation = result['location'] as LatLng;
                      _updateMarkerPosition(_currentLocation);
                      _addressController.text = result['address'] as String;
                      addressError = null;
                    });
                  } else {
                    // Fallback if FullScreenMapPage didn't return result
                    String address = await _getAddressFromLatLng(position);
                    setState(() {
                      _addressController.text = address;
                      addressError = null;
                    });
                  }
                } catch (e) {
                  print('Error getting address: $e');
                  // Still update with geocoded address as fallback
                  String address = await _getAddressFromLatLng(position);
                  setState(() {
                    _addressController.text = address;
                    addressError = null;
                  });
                }
              },
            );
    } catch (e) {
      print('Error rendering Google Maps in web: $e');
      return GestureDetector(
        onTap: () async {
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
                    _addressController.text = address;
                    addressError = null;
                  });
                },
              ),
            ),
          );

          if (result != null && result is Map<String, dynamic>) {
            setState(() {
              _currentLocation = result['location'] as LatLng;
              _updateMarkerPosition(_currentLocation);
              _addressController.text = result['address'] as String;
              addressError = null;
            });
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: custom_Images_asset(
                fit: BoxFit.cover,
                image: AppImages.map2,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                      size: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "اضغط لتحديد موقعك",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  // بناء عرض الخريطة للموبايل
  Widget _buildNativeMapView() {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor))
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
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
              controller.animateCamera(
                  CameraUpdate.newLatLngZoom(_currentLocation, 14.0));
            },
            onTap: (position) async {
              _updateMarkerPosition(position);

              // Get address from the selected position
              try {
                // Update the delivery address field with the selected location
                String address = await _getAddressFromLatLng(position);
                setState(() {
                  _addressController.text = address;
                  addressError = null; // إزالة الخطأ عند تحديد العنوان
                });
              } catch (e) {
                print('Error getting address: $e');
              }
            },
          );
  }

  Widget _buildAddressHint(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Center(
          child: Custom_Text(
            context,
            text: "اضف الموقع بشكل صحيح",
            style: font10Grey400W(context, size: 20),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildAddressTypeSelector() {
    return Consumer<AddressController>(
      builder: (context, addressController, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_Text(
            context,
            text: "تسمية الموقع",
            style: font11Black500W(context, size: 24),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAddressTypeButton(
                0,
                'assets/svg/home-address.svg',
                'منزل',
              ),
              _buildAddressTypeButton(
                1,
                'assets/svg/job-address.svg',
                'عمل',
              ),
              _buildAddressTypeButton(
                2,
                'assets/svg/add-address.svg',
                'أخرى',
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildAddressTypeButton(int index, String svgPath, String label) {
    return InkWell(
      onTap: () {
        setState(() => selectedAddressType = index);
      },
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: selectedAddressType == index
                  ? AppColors.primaryColor
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SvgPicture.asset(
                svgPath,
                height: 40,
                width: 40,
                colorFilter: ColorFilter.mode(
                  selectedAddressType == index ? Colors.white : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selectedAddressType == index
                  ? AppColors.primaryColor
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
          context,
          "عنوان التسليم",
          "الرياض, السعودية",
          controller: _addressController,
          errorText: addressError,
          prefixIcon: Icons.location_on_outlined,
        ),
        _buildTextField(
          context,
          "اسم الاتصال",
          "ناصر",
          controller: _nameController,
          errorText: nameError,
          prefixIcon: Icons.person_outline,
        ),
        _buildPhoneField(context),
        _buildTextField(
          context,
          "اسم الشارع",
          "اسم الشارع (اختياري)",
          controller: _streetController,
          prefixIcon: Icons.signpost_outlined,
        ),
        _buildOptionalFields(context),
      ],
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String title,
    String hint, {
    TextEditingController? controller,
    String? errorText,
    IconData? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(
          context,
          text: title,
          style: font11Black500W(context, size: 24),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: errorText != null ? Colors.red : AppColors.gryColor_6,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: errorText != null ? Colors.red : AppColors.primaryColor,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            errorText: errorText,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color:
                        errorText != null ? Colors.red : AppColors.primaryColor,
                  )
                : null,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(
          context,
          text: "رقم الهاتف",
          style: font11Black500W(context, size: 24),
        ),
        const SizedBox(height: 10),
        CustomPhoneInput(
          controller: _phoneController,
          onChanged: (value) {
            if (phoneError != null) {
              setState(() {
                phoneError = null;
              });
            }
          },
          errorText: phoneError,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildOptionalFields(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(
                context,
                text: "المنزل",
                style: font11Black500W(context, size: 24),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _houseController,
                decoration: InputDecoration(
                  hintText: "المنزل (اختياري)",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.gryColor_6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  prefixIcon: const Icon(
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
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(
                context,
                text: "أرضية",
                style: font11Black500W(context, size: 24),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _floorController,
                decoration: InputDecoration(
                  hintText: "أرضية (اختياري)",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.gryColor_6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  prefixIcon: const Icon(
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
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: custom_Button(
          context,
          w: 360,
          h: 60,
          title: _isEditMode ? "تحديث العنوان" : "تاكيد العنوان",
          style: font12White600W(context, size: 15),
          onPressed: () {
            if (_validateFields()) {
              final addressController =
                  Provider.of<AddressController>(context, listen: false);

              if (_isEditMode) {
                // تحديث عنوان موجود
                addressController.updateAddress(
                  Address(
                    id: widget.address!.id,
                    addressType: _getAddressTypeString(),
                    contactPersonName: _nameController.text,
                    contactPersonNumber: _phoneController.text,
                    address: _addressController.text,
                    latitude: _currentLocation.latitude,
                    longitude: _currentLocation.longitude,
                    userId: widget.address!.userId,
                    createdAt: widget.address!.createdAt,
                    updatedAt: DateTime.now(),
                    zoneId: widget.address!.zoneId,
                    zoneIds: widget.address!.zoneIds,
                    floor: _floorController.text,
                    road: _streetController.text,
                    house: _houseController.text,
                  ),
                );
              } else {
                // إضافة عنوان جديد
                addressController.addAddress(
                  Address(
                    id: DateTime.now().millisecondsSinceEpoch,
                    addressType: _getAddressTypeString(),
                    contactPersonName: _nameController.text,
                    contactPersonNumber: _phoneController.text,
                    address: _addressController.text,
                    latitude: _currentLocation.latitude,
                    longitude: _currentLocation.longitude,
                    userId: 1,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                    zoneId: 1,
                    zoneIds: [1],
                    floor: _floorController.text,
                    road: _streetController.text,
                    house: _houseController.text,
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('يرجى إدخال جميع البيانات المطلوبة'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // التحقق من صحة البيانات
  bool _validateFields() {
    bool isValid = true;

    // التحقق من عنوان التسليم
    if (_addressController.text.isEmpty) {
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
    if (_nameController.text.isEmpty) {
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
    if (_phoneController.text.isEmpty) {
      setState(() {
        phoneError = "يرجى إدخال رقم الهاتف";
      });
      isValid = false;
    } else if (_phoneController.text.length < 9) {
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

  // الحصول على نوع العنوان كنص
  String _getAddressTypeString() {
    switch (selectedAddressType) {
      case 0:
        return 'منزل';
      case 1:
        return 'عمل';
      case 2:
        return 'أخرى';
      default:
        return 'منزل';
    }
  }

  Future<String> _getAddressFromLatLng(LatLng position) async {
    try {
      // Use the same approach for both web and mobile
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

    // Use more descriptive fallback that includes coordinates
    return 'الموقع: ${position.latitude.toStringAsFixed(5)}, ${position.longitude.toStringAsFixed(5)}';
  }
}
