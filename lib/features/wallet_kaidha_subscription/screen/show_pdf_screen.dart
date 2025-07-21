// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously, camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/widgets/custom_button.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';

class Show_Pdf_Screen extends StatefulWidget {
  const Show_Pdf_Screen({super.key});

  @override
  State<Show_Pdf_Screen> createState() => _Show_Pdf_ScreenState();
}

class _Show_Pdf_ScreenState extends State<Show_Pdf_Screen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KaidhaSubscription_Controller>(
      builder: (KaidhaSubController) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.access_time, size: 80, color: Colors.green),
                  SizedBox(height: 20),
                  Text('طلبك قيد المراجعة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'طلبك قيد المراجعة النهائية. سيتم تحديد الحد الائتماني وتفعيل المحفظة خلال 24 - 48 ساعة. سنقوم بإشعارك فور الانتهاء.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 32),

                  // Progress indicator

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStepCircle(Icons.check, 'تم استلام الطلب', Colors.green),
                      _buildStepLine(),
                      _buildStepCircle(Icons.hourglass_bottom, 'قيد المراجعة', Colors.green),
                      _buildStepLine(),
                      _buildStepCircle(null, 'تفعيل المحفظة', Colors.grey),
                    ],
                  ),

                  SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.access_time, color: Colors.black54),
                      SizedBox(width: 8),
                      Text(
                        'الوقت المتوقع 24-48 ساعة عمل',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Text('هل لديك استفسار؟', style: TextStyle(fontSize: 16)),

                  SizedBox(height: 10),

                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.orange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                    icon: Icon(Icons.phone, color: Colors.orange),
                    label: Text('تواصل مع خدمة العملاء', style: TextStyle(color: Colors.orange, fontSize: 16)),
                  ),

                  //
                ],
              ),

              //

              Container(
                width: 1170,
                padding: EdgeInsets.all(size_15(context)),
                child: CustomButton(
                  isLoading: false,
                  color: AppColors.orangeColor,
                  buttonText: "استعراض العقد",
                  onPressed: () async {
                    // Get.toNamed(RouteHelper.getContract_ReviewRoute());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStepCircle(IconData? icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: color.withOpacity(0.1),
          child: icon != null
              ? Icon(icon, color: color, size: 18)
              : Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: color),
        ),
      ],
    );
  }

  Widget _buildStepLine() {
    return Container(
      width: 20,
      height: 1,
      color: Colors.grey[400],
    );
  }
}

//

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Icon(Icons.access_time, size: 80, color: Colors.green),
        SizedBox(height: 20),
        Text(
          'طلبك قيد المراجعة',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'طلبك قيد المراجعة النهائية. سيتم تحديد الحد الائتماني وتفعيل المحفظة خلال 24 - 48 ساعة. سنقوم بإشعارك فور الانتهاء.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 32),
        // Progress indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStepCircle(Icons.check, 'تم استلام الطلب', Colors.green),
            _buildStepLine(),
            _buildStepCircle(Icons.hourglass_bottom, 'قيد المراجعة', Colors.green),
            _buildStepLine(),
            _buildStepCircle(null, 'تفعيل المحفظة', Colors.grey),
          ],
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.access_time, color: Colors.black54),
            SizedBox(width: 8),
            Text(
              'الوقت المتوقع 24-48 ساعة عمل',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
        Spacer(),
        Text('هل لديك استفسار؟', style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.orange),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
          icon: Icon(Icons.phone, color: Colors.orange),
          label: Text(
            'تواصل مع خدمة العملاء',
            style: TextStyle(color: Colors.orange, fontSize: 16),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildStepCircle(IconData? icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: color.withOpacity(0.1),
          child: icon != null
              ? Icon(icon, color: color, size: 18)
              : Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: color),
        ),
      ],
    );
  }

  Widget _buildStepLine() {
    return Container(
      width: 20,
      height: 1,
      color: Colors.grey[400],
    );
  }
}
