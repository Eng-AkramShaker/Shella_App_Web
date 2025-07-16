import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/ServiceInfoPage.dart';
import 'package:shella_design/features/serveMe/widgets/CarsWorkShopCard.dart';
import 'package:shella_design/features/serveMe/widgets/HomeServiceCard.dart';
import 'package:shella_design/features/serveMe/widgets/LocationInfo.dart';
import 'package:shella_design/features/serveMe/widgets/greenAppBar.dart';
import 'package:shella_design/features/serveMe/widgets/important_services_card.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';

class CarsServicesPage extends StatelessWidget {
  const CarsServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List data = [];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: greenAppBar(
        context,
        'صيانة السيارات ',
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                labelText: 'ابحث عن خدمة معينة....',
                borderColor: AppColors.darkGreyColor,
                borderWidth: 1,
                enableBorderColor: AppColors.backgroundColor,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.darkGreyColor,
                  size: 25.r,
                ),
                padding: 0,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: size.height / 5,
                child: Image.asset(
                  'assets/images/FRAME (22) 1.png',
                  fit: BoxFit.fill,
                  width: size.width,
                  height: size.height / 3.2,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: size.height / 2.8,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceInfoPage(name: 'صيانة دورية', image: 'assets/images/FRAME (24) 1.png'),
                          ),
                        );
                      },
                      child: HomeServiceCard(
                        selected: index == 0,
                        image: 'assets/images/ph_hammer-thin.png',
                        title: 'صيانة \n دورية',
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                child: Custom_Text(
                  context,
                  text: 'اهم الخدمات',
                  size: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: size.height / 2.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ImprtantServicesCard(
                      image: 'assets/images/arcticons_aurora-services.png',
                      selected: index == 0,
                      title: 'صيانة دورية',
                      suptitle: 'صيانة دورية حسب توصيات المصنع',
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                child: Custom_Text(
                  context,
                  text: 'الورش المتاحة',
                  size: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: size.height / 2.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return CarsWorkShopCard();
                  },
                ),
              ),
              LocationInfo(
                icon: Icons.location_on_outlined,
                title: 'الموقع',
                content: '7754 طريق الدائري، 3477، الرياض، الرياض 362221',
                image: 'assets/images/map.png',
              ),
              custom_Images_asset(
                image: 'assets/images/Frame 26080520.png',
                w: width_media(context),
                h: 150.h,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
