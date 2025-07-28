import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTimelineTile(
              isFirst: true,
              isLast: false,
              isCompleted: true,
              icon: Icons.done,
              title: MainAppConstants.orderConfirmedIsDone,
              time: "7:00",
            ),
            _buildTimelineTile(
              isFirst: false,
              isLast: false,
              isCompleted: true,
              icon: Icons.done,
              title: MainAppConstants.preparing,
              time: "7:15",
            ),
            _buildTimelineTile(
              isFirst: false,
              isLast: false,
              isCompleted: false,
              icon: Icons.local_shipping,
              title: MainAppConstants.inTheWay,
              time: MainAppConstants.soon,
            ),
            _buildTimelineTile(
              isFirst: false,
              isLast: false,
              isCompleted: false,
              icon: Icons.location_on_outlined,
              title: MainAppConstants.delivered,
              time: "------",
            ),
          
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineTile({
    required bool isFirst,
    required bool isLast,
    required bool isCompleted,
    required IconData icon,
    required String title,
    required String time,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        thickness: 1,
        color:  Colors.green ,
      ),
      indicatorStyle: IndicatorStyle(
        width: 30,
        color: isCompleted ? Colors.green : AppColors.wtColor,
        iconStyle: IconStyle(
          iconData: icon,
          color: isCompleted ? Colors.white:Colors.green,
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6),
            Text(
              time,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}