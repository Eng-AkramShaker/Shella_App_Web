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
import 'package:shella_design/common/util/app_colors.dart';
import '../controllers/map_controller.dart';
import '../widgets/map_widget.dart';

class AddNewAddressScreen extends StatefulWidget {
  final Address? editAddress;

  const AddNewAddressScreen({super.key, this.editAddress});

  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  Address? editAddress;
  late final ProfileController _controller;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  late MapController _mapController;

  bool _isInitialized = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = Provider.of<ProfileController>(context, listen: false);
    _controller.resetOperationState();
    _isEditing = widget.editAddress != null;
    _mapController = MapController(
      initialLocation: _isEditing ? null : const LatLng(24.7136, 46.6753),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _initializeForm();
      _isInitialized = true;
    }
  }

  void _initializeForm() {
    if (widget.editAddress != null) {
      final addressArg = widget.editAddress!;

      addressController.text = addressArg.address;
      phoneController.text = addressArg.contactPersonNumber;
      nameController.text = addressArg.contactPersonName;
      streetController.text = addressArg.road ?? '';

      double? lat = double.tryParse(addressArg.latitude);
      double? lng = double.tryParse(addressArg.longitude);

      if (lat != null && lng != null) {
        _mapController.setSelectedLocation(LatLng(lat, lng));
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (addressArg.addressType == 'عمل') {
          _controller.updateTybe(2);
        } else if (addressArg.addressType == 'إضافة') {
          _controller.updateTybe(3);
        } else {
          _controller.updateTybe(1);
        }

        _controller.updatefloor(addressArg.floor == 'أرضية' ? 2 : 1);
      });
    } else {
      _mapController.setSelectedLocation(const LatLng(24.7136, 46.6753));
    }
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    nameController.dispose();
    streetController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height / 15),
        child: GreanAppBar(
          text: _isEditing ? "تعديل العنوان" : "إضافة عنوان جديد",
          icon: Icons.location_on,
        ),
      ),
      body: Selector<ProfileController, RequestState>(
        selector: (_, controller) => controller.adressstate,
        builder: (context, adressState, child) {
          if (adressState == RequestState.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<ProfileController>().resetOperationState();
              Navigator.of(context).pop(true);
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
              ChangeNotifierProvider.value(
                value: _mapController,
                child: MapWidget(),
              ),
              SizedBox(height: 20.h),
              Text(
                _isEditing ? "تعديل العنوان" : "أضف عنوانًا جديدًا",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
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
                      controller: addressController,
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
                            addressController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('يرجى ملء جميع الحقول المطلوبة')),
                          );
                          return;
                        }
                        if (_mapController.selectedLocation == null) {
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
                          id: _isEditing ? widget.editAddress!.id : 0,
                          addressType: addressType,
                          contactPersonName: nameController.text,
                          contactPersonNumber: phoneController.text,
                          address: addressController.text,
                          latitude: _mapController.selectedLocation!.latitude
                              .toString(),
                          longitude: _mapController.selectedLocation!.longitude
                              .toString(),
                          userId: _isEditing ? widget.editAddress!.userId : 0,
                          createdAt: editAddress?.createdAt ?? DateTime.now(),
                          updatedAt: DateTime.now(),
                          zoneId: 1,
                          zoneIds: [],
                          floor: controller.floor == 1 ? 'منزل' : 'أرضية',
                          road: streetController.text,
                        );

                        if (_isEditing) {
                          _controller.updateAddress(address);
                        } else {
                          _controller.addAddress(address);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                          editAddress != null ? "تحديث العنوان" : "حفظ العنوان",
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
