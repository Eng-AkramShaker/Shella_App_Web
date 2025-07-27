import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/loading_progress/loading/custom_loading.dart';
import 'package:shella_design/features/settings/controllers/map_controller.dart';
import 'package:shella_design/features/settings/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/settings/widgets/mobile/build_mobile_address/build_add_address_body.dart';
import 'package:shella_design/features/settings/widgets/mobile/greanappbar.dart';

import '../domain/models/profile_detailes_model.dart';

class AddNewAddressScreen extends StatefulWidget {
  final Address? editAddress;

  const AddNewAddressScreen({super.key, this.editAddress});

  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  Address? editAddress;
  late final ProfileController profileController;
  late MapController _mapController;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  bool _isInitialized = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    profileController = Provider.of<ProfileController>(context, listen: false);

    _isEditing = widget.editAddress != null;
    _mapController = MapController(
      initialLocation: _isEditing ? null : const LatLng(24.7136, 46.6753),
    );

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized && widget.editAddress != null) {
      profileController.initializeEditForm(
        widget.editAddress!,
        _mapController,
        nameController,
        phoneController,
        addressController,
        streetController,
        profileController.updateTybe,
        profileController.updateFloor,
      );
      _isInitialized = true;
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
        selector: (_, controller) => controller.addressState,
        builder: (context, addressState, child) {
          if (addressState == RequestState.loading) {
            return CustomLoading(color: AppColors.primaryColor);
          }
          if (addressState == RequestState.error) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
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
          child: buildAddAddressBody(
              _mapController,
              _isEditing,
              nameController,
              addressController,
              phoneController,
              streetController,
              profileController,
              widget.editAddress),
        ),
      ),
    );
  }
}
