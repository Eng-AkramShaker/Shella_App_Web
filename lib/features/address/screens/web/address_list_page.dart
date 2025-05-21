import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button_2.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/address/controllers/address_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shella_design/common/widgets/dialog/confirmation_dialog.dart';
import 'package:shella_design/features/address/screens/mobile/add_new_address.dart';
import 'package:shella_design/features/address/screens/mobile/full_screen_map.dart';
import 'package:shella_design/features/address/screens/web/add_address_page.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'address_card.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';

class AddressListPage extends StatefulWidget {
  const AddressListPage({
    super.key,
    // هذه المعاملات لن نستخدمها بعد الآن لأننا سنستخدم controller
    this.address,
    this.onEdit,
    this.onDelete,
    this.onAddNew,
  });

  final String? address;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onAddNew;

  @override
  State<AddressListPage> createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  // خريطة Google Maps
  final Completer<GoogleMapController> _mapController = Completer();
  static const LatLng _defaultLocation =
      LatLng(24.7136, 46.6753); // الرياض كموقع افتراضي
  final Set<Marker> _markers = {};
  LatLng _currentLocation = _defaultLocation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    // استدعاء قائمة العناوين عند بدء الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final addressController =
          Provider.of<AddressController>(context, listen: false);
      if (addressController.addressState != RequestState.success) {
        addressController.getAddresses();
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

      try {
        // الحصول على الموقع الحالي
        final position = await Geolocator.getCurrentPosition(
          timeLimit: const Duration(seconds: 5),
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          _currentLocation = LatLng(position.latitude, position.longitude);
          _markers.clear(); // مسح العلامات السابقة
          _markers.add(
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: _currentLocation,
              infoWindow: const InfoWindow(title: 'موقعك الحالي'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
            ),
          );
          _isLoading = false;
        });

        // تحريك الكاميرا إلى الموقع الحالي
        if (_mapController.isCompleted) {
          final GoogleMapController controller = await _mapController.future;
          controller
              .animateCamera(CameraUpdate.newLatLngZoom(_currentLocation, 14));
        }
      } catch (timeoutError) {
        // في حالة انتهاء مهلة طلب الموقع، استخدم الموقع الافتراضي
        setState(() {
          _markers.add(
            Marker(
              markerId: const MarkerId('defaultLocation'),
              position: _currentLocation,
              infoWindow: const InfoWindow(title: 'الموقع الافتراضي'),
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

  // دالة مساعدة للتنقل إلى صفحة إضافة العنوان
  void _navigateToAddAddress() {
    // Reset address state before navigation to prevent immediate return
    final addressController =
        Provider.of<AddressController>(context, listen: false);
    addressController.resetAddressState();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddAddressPage(),
      ),
    ).then((_) {
      // تحديث قائمة العناوين بعد الإضافة
      addressController.getAddresses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.location_on, color: Colors.white),
            const SizedBox(width: 8),
            const Text(
              'عناويني',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<AddressController>(
        builder: (context, addressController, _) {
          if (addressController.addressState == RequestState.initial ||
              addressController.addressState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (addressController.addressState == RequestState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('حدث خطأ: ${addressController.errorMessage}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => addressController.getAddresses(),
                    child: const Text('إعادة المحاولة'),
                  ),
                ],
              ),
            );
          }

          // حالة نجاح جلب العناوين
          return Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // قائمة العناوين
                Expanded(
                  child: addressController.addresses != null &&
                          addressController.addresses!.isNotEmpty
                      ? ListView.builder(
                          itemCount: addressController.addresses!.length,
                          itemBuilder: (context, index) {
                            final address = addressController.addresses![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: AddressCard(
                                address: address,
                                isSelected: addressController
                                    .isAddressSelected(address.id),
                                onTap: () {
                                  // تحديد العنوان
                                  addressController
                                      .setSelectedAddress(address.id);
                                },
                                onEditPressed: () {
                                  // Reset address state before navigation to prevent issues
                                  addressController.resetAddressState();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddAddressPage(address: address),
                                    ),
                                  ).then((_) {
                                    // تحديث قائمة العناوين بعد التعديل
                                    addressController.getAddresses();
                                    setState(() {}); // إعادة بناء الواجهة
                                  });
                                },
                                onDeletePressed: () {
                                  // عرض مربع حوار تأكيد الحذف
                                  showConfirmationDialog(
                                    context: context,
                                    title: 'تأكيد الحذف',
                                    description:
                                        'هل أنت متأكد من رغبتك في حذف هذا العنوان؟',
                                    confirmButtonText: 'حذف',
                                    cancelButtonText: 'إلغاء',
                                    onConfirm: () {
                                      addressController
                                          .removeAddress(address.id.toString());
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('لا توجد عناوين محفوظة بعد'),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _navigateToAddAddress,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                ),
                                child: const Text('إضافة عنوان جديد'),
                              ),
                            ],
                          ),
                        ),
                ),

                // قسم الخريطة
                Container(
                  height: 275,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        // استخدام صورة خريطة ثابتة للويب في حالة وجود خطأ في تحميل الخرائط
                        if (kIsWeb)
                          _buildWebMapView()
                        else
                          _buildNativeMapView(),

                        // زر إضافة عنوان جديد
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: IconButtonCircle(
                            onPressed: _navigateToAddAddress,
                            icon: Icons.add_location_alt,
                            iconcolor: AppColors.backgroundColor,
                            color: AppColors.primaryColor,
                          ),
                        ),

                        // زر عرض الخريطة بملء الشاشة
                        Positioned(
                          top: 10,
                          right: 10,
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
                              icon: const Icon(Icons.fullscreen_outlined,
                                  color: AppColors.primaryColor, size: 28),
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
                    ),
                  ),
                ),

                // أزرار التأكيد والتغيير
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    custom_Button(
                      context,
                      h: 60,
                      w: 260,
                      title: "تأكيد العنوان",
                      style: font12White600W(context, size: 15),
                      onPressed: () {
                        // التأكد من وجود عنوان محدد
                        if (addressController.selectedAddressId != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم تأكيد العنوان بنجاح'),
                              backgroundColor: AppColors.primaryColor,
                            ),
                          );
                          Navigator.pop(context); // العودة للصفحة السابقة
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('الرجاء اختيار عنوان أولاً'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                    custom_Button(
                      context,
                      h: 60,
                      w: 260,
                      title: "تغيير العنوان",
                      onPressed: _navigateToAddAddress,
                      style: font12Green600W(context, size: 15),
                      buttoncolor: AppColors.backgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        onPressed: _navigateToAddAddress,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // بناء عرض الخريطة للويب
  Widget _buildWebMapView() {
    try {
      return _isLoading
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
                // تحريك الكاميرا إلى الموقع الحالي بعد إنشاء الخريطة
                controller.animateCamera(
                    CameraUpdate.newLatLngZoom(_currentLocation, 14.0));
              },
            );
    } catch (e) {
      print('Error rendering Google Maps in web: $e');
      // عرض صورة خريطة ثابتة كبديل في حالة وجود خطأ
      return Stack(
        children: [
          Positioned.fill(
            child: custom_Images_asset(
              image: AppImages.map2,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.primaryColor,
                    size: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "اضغط لعرض الخريطة",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  // بناء عرض الخريطة للموبايل
  Widget _buildNativeMapView() {
    return _isLoading
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
              // تحريك الكاميرا إلى الموقع الحالي بعد إنشاء الخريطة
              controller.animateCamera(
                  CameraUpdate.newLatLngZoom(_currentLocation, 14.0));
            },
          );
  }
}
