import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/features/profile_detailes/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/features/profile_detailes/widgets/greanappbar.dart';
import 'package:shella_design/features/profile_detailes/widgets/locationTag.dart';
import 'package:shella_design/features/profile_detailes/widgets/selectableButton.dart';
import 'package:shella_design/features/profile_detailes/widgets/textField.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final TextEditingController adressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height / 15),
        child: GreanAppBar(
          text: "إضافة عنوان جديد",
          icon: Icons.location_on,
        ),
      ),
      body: Selector<ProfileController, RequestState>(
        selector: (_, controller) => controller.adressstate,
        builder: (context, adressState, child) {
          if (adressState == RequestState.loading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (adressState == RequestState.error) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.read<ProfileController>().errorMessage ?? 'Request Failed'),
                ),
              );
            });
          }
          if (adressState == RequestState.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              pushReplacementNamedRoute(context, AppRoutes.addressDetails);
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
              Container(
                height: size.height / 4,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2.w),
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtI8sw5CMSZixl8-rs55HKGOxOay68pSol0l1qgQ4KalA1kqCx6SNtLCsz8o8RkgVa4wE&usqp=CAU'),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Consumer<ProfileController>(
                builder: (context, controller, _) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("تسمية الموقع", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
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
                            color: (controller.tybe == 1) ? AppColors.primaryColor : AppColors.darkGreyColor,
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
                            color: (controller.tybe == 2) ? AppColors.primaryColor : AppColors.darkGreyColor,
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
                            color: (controller.tybe == 3) ? AppColors.primaryColor : AppColors.darkGreyColor,
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
                            (controller.floor == 1) ? AppColors.greenColor : AppColors.darkGreyColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            context.read<ProfileController>().updatefloor(2);
                          },
                          child: selectableButton(
                            "أرضية (اختياري)",
                            (controller.floor == 2) ? AppColors.greenColor : AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        controller.addAddress(
                          Address(
                            id: 0,
                            addressType: (controller.tybe == 1) ? 'منزل' : "عمل",
                            contactPersonName: nameController.text,
                            contactPersonNumber: phoneController.text,
                            address: adressController.text,
                            latitude: 24.57934470964999,
                            longitude: 46.5564288944006,
                            userId: 0,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                            zoneId: 1,
                            zoneIds: [],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: const Text("حفظ العنوان", style: TextStyle(fontSize: 18, color: Colors.white)),
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
