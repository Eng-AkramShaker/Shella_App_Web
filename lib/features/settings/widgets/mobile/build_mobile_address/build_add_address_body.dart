import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/features/settings/controllers/map_controller.dart';
import 'package:shella_design/features/settings/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/settings/widgets/mobile/build_mobile_address/selectable_button.dart';
import 'package:shella_design/features/settings/widgets/mobile/locationTag.dart';
import 'package:shella_design/features/settings/widgets/mobile/map_widget.dart';
import 'package:shella_design/features/settings/widgets/mobile/textField.dart';

import '../../../domain/models/profile_detailes_model.dart';
import 'build_label_text.dart';

Widget buildAddAddressBody(
    MapController mapController,
    bool isEditing,
    TextEditingController addressController,
    TextEditingController nameController,
    TextEditingController phoneController,
    TextEditingController streetController,
    ProfileController profileController,
    Address? editAddress,
    ) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChangeNotifierProvider.value(
          value: mapController,
          child: MapWidget(),
        ),
        SizedBox(height: 20.h),
        buildLabelTextAddress(isEditing),
        SizedBox(height: 20.h),
        Consumer<ProfileController>(
          builder: (context, controller, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("تسمية الموقع",
                  style:
                  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
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
                      label: "آخر",
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
                      context.read<ProfileController>().updateFloor(1);
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
                      context.read<ProfileController>().updateFloor(2);
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
                  profileController.submitAddress(
                    context,
                    editAddress,
                    mapController,
                    isEditing,
                    addressController,
                    phoneController,
                    nameController,
                    streetController,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                    editAddress != null ? "تحديث العنوان" : "حفظ العنوان",
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
