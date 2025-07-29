import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/receiver_info.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/sender_info.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/tab_bar_packets.dart';

class PacketsPosition extends StatefulWidget {
  const PacketsPosition({super.key});

  @override
  State<PacketsPosition> createState() => _PacketsPositionState();
}

class _PacketsPositionState extends State<PacketsPosition> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _submitForm() {
    nav.push(AppRoutes.driverOffers);
    // if (_formKey.currentState!.validate()) {
    //   // _formKey.currentState!.save();
    //   // print('Form data: $_formData');
    //   // Process your form data here
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: customAppBar(context, title: MainAppConstants.packetsPosition, img: AppImages.packet),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),

            //tab bar header
            TabBarPackets(tabController: _tabController),

            //   TabBarView
            Expanded(
              child: Form(
                key: _formKey,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SenderInfo(
                      formData: _formData,
                      onNext: () => _tabController.animateTo(1),
                    ),
                    ReceiverInfo(
                      formData: _formData,
                      onPrevious: () => _tabController.animateTo(0),
                      onSubmit: _submitForm,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
