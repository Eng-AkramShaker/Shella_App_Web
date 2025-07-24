import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/loading_progress/loading/custom_loading.dart';
import 'package:shella_design/features/settings/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/settings/widgets/mobile/AdressCard.dart';
import 'package:shella_design/features/settings/widgets/mobile/address_error_widget.dart';
import 'package:shella_design/features/settings/widgets/mobile/build_mobile_address/build_appBar.dart';
import 'package:shella_design/features/settings/widgets/mobile/empty_address.dart';


class AddressDetailsPage extends StatelessWidget {
  const AddressDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(80, size.height / 15),
        child: buildAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ProfileController>(
              builder: (context, controller, _) {
                if (controller.addressState == RequestState.initial) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    controller.getAddress();
                  });
                  return CustomLoading(color: AppColors.primaryColor);
                }

                if (controller.addressState == RequestState.loading) {
                  return CustomLoading(color: AppColors.primaryColor);
                }

                if (controller.addressState == RequestState.error) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {});
                  return AddressErrorWidget(controller: controller);
                }
                if (controller.getAddresses == null ||
                    controller.getAddresses!.isEmpty) {
                  return EmptyAddressWidget();
                }
                return ListView.builder(
                  itemCount: controller.getAddresses!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AdressCard(
                      address: controller.getAddresses![index],
                      onDelete: () => controller.removeAddress(
                          controller.getAddresses![index].idString),
                      onEdit: () => controller.navigateToEditScreen(
                          context, controller.getAddresses![index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton:
      Consumer<ProfileController>(builder: (context, controller, _) {
        return FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Provider.of<ProfileController>(context, listen: false)
                .navigateToAddScreen(context);
            // controller.navigateToAddScreen(context);
          },
        );
      }),
    );
  }
}