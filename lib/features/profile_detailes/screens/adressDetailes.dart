import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/profile_detailes/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/profile_detailes/widgets/AdressCard.dart';
import 'package:shella_design/features/profile_detailes/widgets/greanappbar.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_buttons.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_loading.dart';
import '../domain/models/profile_detailes_model.dart';
import 'addNewAdress.dart';

class AddressDetailsPage extends StatelessWidget {
  const AddressDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(80, size.height / 15),
        child: GreanAppBar(
          text: 'عناويني',
          icon: Icons.location_on,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<ProfileController>(
            builder: (context, controller, _) {
              if (controller.adressstate == RequestState.initial) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  controller.getAdress();
                });
                return Center(
                  child: ProfileLoading(color: AppColors.primaryColor),
                );
              }

              if (controller.adressstate == RequestState.loading) {
                return Center(
                  child: ProfileLoading(color: AppColors.primaryColor),
                );
              }

              if (controller.adressstate == RequestState.error) {
                WidgetsBinding.instance.addPostFrameCallback((_) {});
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 40.w),
                      const SizedBox(height: 20),
                      Text(
                        controller.errorMessage ?? 'فشل حذف العنوان',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      ProfileButton(
                          title: 'أعد المحاولة',
                          onTap: () {
                            controller.resetState();
                            controller.getAdress();
                          }),
                    ],
                  ),
                );
              }
              if (controller.getedaddress == null || controller.getedaddress!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_off,
                        size: 60.w,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'لا توجد عناوين بعد',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'اضغط على الزر (+) لإضافة عنوان جديد',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[500],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: controller.getedaddress!.length,
                itemBuilder: (BuildContext context, int index) {
                  return AdressCard(
                    address: controller.getedaddress![index],
                    onDelete: () => controller.removeAddress(controller.getedaddress![index].idString),
                    onEdit: () => _navigateToEditScreen(context, controller.getedaddress![index]),
                  );
                },
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _navigateToAddScreen(context);
        },
      ),
    );
  }

  void _navigateToEditScreen(BuildContext context, Address address) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewAddressScreen(editAddress: address),
      ),
    ).then((result) {
      if (result == true) {
        context.read<ProfileController>().getAdress();
      }
    });
  }

  void _navigateToAddScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewAddressScreen()),
    ).then((result) {
      if (result == true) {
        context.read<ProfileController>().getAdress();
      }
    });
  }
}
