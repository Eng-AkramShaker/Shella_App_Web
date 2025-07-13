import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shella_design/features/profile_detailes/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/profile_detailes/widgets/AdressCard.dart';
import 'package:shella_design/features/profile_detailes/widgets/greanappbar.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
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
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(controller.errorMessage ?? 'فشلت العملية'),
                    ),
                  );
                });
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline,
                          color: Colors.red, size: 50),
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
              return ListView.builder(
                itemCount: controller.getedaddress!.length,
                itemBuilder: (BuildContext context, int index) {
                  return AdressCard(
                    address: controller.getedaddress![index],
                    onDelete: () => controller.removeAddress(
                        controller.getedaddress![index].idString),
                    onEdit: () => _navigateToEditScreen(
                        context, controller.getedaddress![index]),
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
    Navigator.pushNamed(
      context,
      AppRoutes.addaddress,
      arguments: address,
    );
  }

  void _navigateToAddScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.addaddress,
    );
  }

  Widget buildMapPlaceholder(Size size) {
    // return Image.asset("assets/images/map_image.png");

    return Opacity(
      opacity: 0.2,
      child: Container(
          height: size.height / 2.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/map_image.png"),
            ),
          )),
    );
    // child: GoogleMap(
    //   onMapCreated: _onMapCreated,
    //   initialCameraPosition: CameraPosition(target: _center, zoom: 14.0),
    //   markers: {Marker(markerId: MarkerId('selectedLocation'), position: _center)},
    // ),
    // );
  }
}
