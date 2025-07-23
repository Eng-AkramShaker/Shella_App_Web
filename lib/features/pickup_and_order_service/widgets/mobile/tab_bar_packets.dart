import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
    
class TabBarPackets extends StatelessWidget {
TabController tabController;
  TabBarPackets({ super.key,required this.tabController });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.wtColor,
      child: TabBar(
        controller: tabController,
        dividerColor: Colors.transparent,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 3.0,
            color: AppColors.primaryColor,
          ),
          insets: EdgeInsets.symmetric(horizontal: 100),
        ),
        tabs: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Custom_Text(
              context,
              maxLines: 1,
              text: MainAppConstants.senderInfo,
              style: font14Black600W(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Custom_Text(
              context,
              maxLines: 1,
              text: MainAppConstants.receiverInfo,
              style: font14Black600W(context),
            ),
          ),
        
        ],
      ),
    );
     
  }
}