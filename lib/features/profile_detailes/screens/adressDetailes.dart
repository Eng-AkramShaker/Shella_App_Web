import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/profile_detailes/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/profile_detailes/widgets/AdressCard.dart';
import 'package:shella_design/features/profile_detailes/widgets/greanappbar.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_navigators.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<ProfileController>(
            builder: (context, controller, _) {
              if (controller.adressstate == RequestState.initial) {
                controller.getAdress();
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  ),
                );
              }

              if (controller.adressstate == RequestState.loading) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  ),
                );
              }

              if (controller.adressstate == RequestState.error) {
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
                  itemCount: controller.getedaddress!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AdressCard(
                      address: controller.getedaddress![index],
                    );
                  },
                ),
              );
            },
          ),
          buildMapPlaceholder(size),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          pushNewScreen(
            context,
            AppRoutes.addaddress,
          );
        },
      ),
    );
  }

  Widget buildMapPlaceholder(Size size) {
    return Container(
      height: size.height / 2.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2.w),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtI8sw5CMSZixl8-rs55HKGOxOay68pSol0l1qgQ4KalA1kqCx6SNtLCsz8o8RkgVa4wE&usqp=CAU'),
        ),
      ),
      // child: GoogleMap(
      //   onMapCreated: _onMapCreated,
      //   initialCameraPosition: CameraPosition(target: _center, zoom: 14.0),
      //   markers: {Marker(markerId: MarkerId('selectedLocation'), position: _center)},
      // ),
    );
  }
}
