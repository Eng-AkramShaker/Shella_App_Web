import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/widget/builds/build_custom_text_form_auth.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/widget/builds/build_date_picker_field.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/widget/builds/build_expiration_date_field.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/widget/builds/build_house_type_radio.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/widget/builds/build_instalment_widget.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/widget/builds/build_material_status_radio.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/lists.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    final kaidhaFormController = Provider.of<KaidhaFormController>(context);
    return Form(
      key: kaidhaFormController.formstate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_Text(context, text: "المعلومات الشخصية", style: font10Black600W(context, size: size_14(context))),
          customTextFormAuth(mycontroller: kaidhaFormController.firstname, text: "الاسم الاول", context: context),
          customTextFormAuth(mycontroller: kaidhaFormController.grandfathername, text: "اسم الجد", context: context),
          customTextFormAuth(mycontroller: kaidhaFormController.fathername, text: "اسم الاب", context: context),
          customTextFormAuth(mycontroller: kaidhaFormController.familyname, text: "اسم العائلة", context: context),
          buildDatePickerField(context),
          SizedBox(height: 10),
          Custom_Text(context, text: "اختر الجنسية", style: font11Black500W(context, size: size_14(context))),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            dropdownColor: AppColors.backgroundColor,
            value: kaidhaFormController.nationality.isNotEmpty ? kaidhaFormController.nationality : null,
            onChanged: (String? newCode) {
              if (newCode != null && newCode.isNotEmpty) {
                setState(() {
                  kaidhaFormController.nationality = newCode;
                });
              }
            },
            items: nationalities.map((country) {
              return DropdownMenuItem<String>(
                value: country['code'],
                child: Row(
                  children: [
                    if (country['code'].isNotEmpty) Text(country['flag'], style: TextStyle(fontSize: 20)),
                    SizedBox(width: 10),
                    Text(country['name']),
                  ],
                ),
              );
            }).toList(),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gryColor_3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.greenColor),
              ),
              border: OutlineInputBorder(),
              hintText: 'اختر الجنسية',
            ),
            validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
          ),
          SizedBox(height: 10),
          buildMaritalStatusRadio(context),
          customTextFormAuth(mycontroller: kaidhaFormController.familynum, text: "عدد افراد الاسرة", context: context),
          customTextFormAuth(
              hintText: "XXXXXX-XXXXX-X",
              obscureText: true,
              isNumber: true,
              mycontroller: kaidhaFormController.cardnum,
              text: "رقم بطاقة الاحوال",
              context: context),
          buildExpirationDateField(context),
          SizedBox(height: 20),
          Custom_Text(context, text: "رقم الهاتف", style: font11Black500W(context, size: size_14(context))),
          SizedBox(height: 10),
          CustomPhoneInput(
            controller: kaidhaFormController.phoneController,
            onChanged: (p0) {},
          ),
          buildHousetypeRadio(context),
          SizedBox(height: 10),
          Custom_Text(context, text: "المدينة", style: font10Black600W(context, size: size_14(context))),
          SizedBox(height: 10),
          DropdownButtonFormField(
            dropdownColor: AppColors.backgroundColor,
            value: kaidhaFormController.saudiCities.isNotEmpty ? kaidhaFormController.saudiCities : null,
            onChanged: (String? newCode) {
              if (newCode != null && newCode.isNotEmpty) {
                setState(() {
                  kaidhaFormController.saudiCities = newCode;
                });
              }
            },
            items: saudiCities.map((saudiCities) {
              return DropdownMenuItem(
                value: saudiCities,
                child: Text(saudiCities),
              );
            }).toList(),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gryColor_3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.greenColor),
              ),
              border: OutlineInputBorder(),
              hintText: 'اختر المدينة',
            ),
            validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
          ),
          SizedBox(height: 20),
          customTextFormAuth(mycontroller: kaidhaFormController.neighbborHood, text: "الحي", context: context),
          customTextFormAuth(mycontroller: kaidhaFormController.employerName, text: "اسم جهة العمل", context: context),
          customTextFormAuth(mycontroller: kaidhaFormController.totalSalary, text: "الراتب الاجمالي", context: context),
          buildInstallmentsRadio(context),
        ],
      ),
    );
  }
}
