import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_styles.dart';

class IndividualsServicePage extends StatefulWidget {
  const IndividualsServicePage({super.key});

  @override
  State<IndividualsServicePage> createState() => _IndividualsServicePageState();
}

class _IndividualsServicePageState extends State<IndividualsServicePage> {
  int? selectedIndex;

  List<int> img = [180, 181, 182, 183, 184, 185, 186, 187, 188];

  List<String> title = [
    "الصيانة المنزلية",
    "المعلمون والتدريب",
    "صيانة السيارات",
    "مواد البناء",
    "المعاملات القانونية",
    "خذ ابني مع ابنك",
    "السفر بين المدن",
    "صالونات رجالية",
    "صالونات نسائية",
  ];

  List<String> routes = [
    AppRoutes.homeservicespage,
    AppRoutes.homeservicespage,
    AppRoutes.carsServicesPage,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context,
          style: font12White600W(context, size: size_14(context)),
          title: "خدمة  الافراد", onPressed: () {
        popRoute(context);
      }, icon: Icons.work_outline_rounded),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              custom_Images_asset(
                  image: AppImages.individualsService, h: 250, w: 250),
              Custom_Text(context,
                  text: "جلب السعاده من الباب الي الباب ",
                  style: font10Black400W(context, size: size_21(context))),
              SizedBox(height: 20),
              Custom_Text(context,
                  text: "هل انت مستعد لارسال شئ مميز",
                  style: font10Grey400W(context, size: size_12(context))),
              SizedBox(height: 25),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 110,
                  mainAxisExtent: 135,
                ),
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: selectedIndex == index
                            ? AppColors.secondaryColor
                            : AppColors.wtColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: AppColors.backgroundColor,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: custom_Images_asset(
                                    image: "assets/images/${img[index]}.png",
                                    h: 90,
                                    w: 90)),
                            Custom_Text(context,
                                text: title[index],
                                style: font11Black500W(context,
                                    size: size_10(context))),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              custom_Button(context,
                  title: "التالي",
                  h: 45,
                  style: font10White400W(context, size: size_14(context)),
                  onPressed: () {
                pushNewScreen(
                  context,
                  routes[selectedIndex!],
                );
              }),
              SizedBox(height: 20),
            ],
          ),
        ]),
      ),
    );
  }
}
