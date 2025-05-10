import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/SectionTitle_Tow.dart';
import 'package:shella_design/features/serveMe/widgets/StoreCard.dart';
import 'package:shella_design/features/serveMe/widgets/greenAppBar.dart';

class CompaniesWorkshopsPage extends StatelessWidget {
  const CompaniesWorkshopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: greenAppBar(
        context,
        'السباكة والكهرباء',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن اسم متجر',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            buildSectionTitleTwo(
              title: 'المتاجر القريبة منك',
              underline: true,
              context: context,
              label: "المزيد",
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return StoreCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
