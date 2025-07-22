// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    // الدول العربية

    List<Map<String, dynamic>> nationalities = [
      {"name": 'اختر الجنسية', 'code': '', 'flag': ''},

      {'name': 'جزائري', 'code': 'DZ', 'flag': '🇩🇿'},
      {'name': 'بحريني', 'code': 'BH', 'flag': '🇧🇭'},
      {'name': 'جزر القمر', 'code': 'KM', 'flag': '🇰🇲'},
      {'name': 'جيبوتي', 'code': 'DJ', 'flag': '🇩🇯'},
      {'name': 'مصري', 'code': 'EG', 'flag': '🇪🇬'},
      {'name': 'عراقي', 'code': 'IQ', 'flag': '🇮🇶'},
      {'name': 'أردني', 'code': 'JO', 'flag': '🇯🇴'},
      {'name': 'كويتي', 'code': 'KW', 'flag': '🇰🇼'},
      {'name': 'لبناني', 'code': 'LB', 'flag': '🇱🇧'},
      {'name': 'ليبي', 'code': 'LY', 'flag': '🇱🇾'},
      {'name': 'موريتاني', 'code': 'MR', 'flag': '🇲🇷'},
      {'name': 'مغربي', 'code': 'MA', 'flag': '🇲🇦'},
      {'name': 'عماني', 'code': 'OM', 'flag': '🇴🇲'},
      {'name': 'فلسطيني', 'code': 'PS', 'flag': '🇵🇸'},
      {'name': 'قطري', 'code': 'QA', 'flag': '🇶🇦'},
      {'name': 'سعودي', 'code': 'SA', 'flag': '🇸🇦'},
      {'name': 'صومالي', 'code': 'SO', 'flag': '🇸🇴'},
      {'name': 'سوداني', 'code': 'SD', 'flag': '🇸🇩'},
      {'name': 'سوري', 'code': 'SY', 'flag': '🇸🇾'},
      {'name': 'تونسي', 'code': 'TN', 'flag': '🇹🇳'},
      {'name': 'إماراتي', 'code': 'AE', 'flag': '🇦🇪'},
      {'name': 'يمني', 'code': 'YE', 'flag': '🇾🇪'},

      // دول رئيسية أخرى
      {'name': 'أمريكي', 'code': 'US', 'flag': '🇺🇸'},
      {'name': 'أسترالي', 'code': 'AU', 'flag': '🇦🇺'},
      {'name': 'برازيلي', 'code': 'BR', 'flag': '🇧🇷'},
      {'name': 'بريطاني', 'code': 'GB', 'flag': '🇬🇧'},
      {'name': 'كندي', 'code': 'CA', 'flag': '🇨🇦'},
      {'name': 'صيني', 'code': 'CN', 'flag': '🇨🇳'},
      {'name': 'فرنسي', 'code': 'FR', 'flag': '🇫🇷'},
      {'name': 'ألماني', 'code': 'DE', 'flag': '🇩🇪'},
      {'name': 'هندي', 'code': 'IN', 'flag': '🇮🇳'},
      {'name': 'إيطالي', 'code': 'IT', 'flag': '🇮🇹'},
      {'name': 'ياباني', 'code': 'JP', 'flag': '🇯🇵'},
      {'name': 'روسي', 'code': 'RU', 'flag': '🇷🇺'},
      {'name': 'جنوب أفريقي', 'code': 'ZA', 'flag': '🇿🇦'},
      {'name': 'إسباني', 'code': 'ES', 'flag': '🇪🇸'},
      {'name': 'تركي', 'code': 'TR', 'flag': '🇹🇷'},
    ];

    return Consumer<KaidhaSubscription_Controller>(builder: (context, KaidhaSub_Controller, _) {
      return Form(
        key: KaidhaSub_Controller.formstate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "المعلومات الشخصية",
              textAlign: TextAlign.center,
              style: font14Black500W(context),
            ),

            _customTextFormAuth(
              context: context,
              text: "الاسم الاول",
              mycontroller: KaidhaSub_Controller.firstname,
              focusNode: KaidhaSub_Controller.firstNameFocus,
              isEmpty: KaidhaSub_Controller.isFirstNameEmpty,
            ),

            _customTextFormAuth(
              mycontroller: KaidhaSub_Controller.fathername,
              text: "اسم الاب",
              context: context,
              focusNode: KaidhaSub_Controller.fatherNameFocus,
              isEmpty: KaidhaSub_Controller.isFatherNameEmpty,
            ),

            _customTextFormAuth(
              mycontroller: KaidhaSub_Controller.grandfathername,
              text: "اسم الجد",
              context: context,
              focusNode: KaidhaSub_Controller.grandFatherNameFocus,
              isEmpty: KaidhaSub_Controller.isGrandFatherNameEmpty,
            ),

            _customTextFormAuth(
              mycontroller: KaidhaSub_Controller.last_name,
              text: "اسم العائلة",
              context: context,
              focusNode: KaidhaSub_Controller.lastNameFocus,
              isEmpty: KaidhaSub_Controller.isLastNameEmpty,
            ),

            _buildDate_old_10(context, KaidhaSub_Controller),

            SizedBox(height: 10),
            Text(
              "اختر الجنسية",
              textAlign: TextAlign.center,
              style: font14Black500W(context),
            ),
            SizedBox(height: 10),

            //  'اختر الجنسية'

            Focus(
              focusNode: KaidhaSub_Controller.nationalityFocus,
              child: Container(
                key: KaidhaSubscription_Controller.nationalityKey,
                child: DropdownButtonFormField<String>(
                  value: nationalities.firstWhere(
                    (c) => c['name'] == KaidhaSub_Controller.nationality,
                    orElse: () => {'code': null},
                  )['code'],
                  onChanged: (String? newCode) {
                    if (newCode != null && newCode.isNotEmpty) {
                      setState(() {
                        final selectedCountry = nationalities.firstWhere(
                          (country) => country['code'] == newCode,
                          orElse: () => {'name': '', 'code': '', 'flag': ''},
                        );

                        KaidhaSub_Controller.nationality = selectedCountry['name'] ?? '';
                        KaidhaSub_Controller.isNationalityEmpty = false;
                      });
                    }
                  },
                  items: nationalities.map((country) {
                    final code = country['code'] ?? '';
                    final name = country['name'] ?? '';
                    final flag = country['flag'] ?? '';

                    return DropdownMenuItem<String>(
                      value: code,
                      child: Row(
                        children: [
                          if (code.isNotEmpty && flag.isNotEmpty) Text(flag, style: TextStyle(fontSize: 20)),
                          SizedBox(width: 10),
                          Text(name),
                        ],
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    hintText: 'اختر الجنسية',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: KaidhaSub_Controller.isNationalityEmpty ? Colors.red : AppColors.gryColor_3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: KaidhaSub_Controller.isNationalityEmpty ? Colors.red : AppColors.greenColor,
                      ),
                    ),
                  ),
                  validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
                ),
              ),
            ),

            SizedBox(height: 10),

            _buildMaritalStatusRadio(context),

            // عدد أفراد الأسرة
            _custom_number(
              mycontroller: KaidhaSub_Controller.number_of_family_members,
              text: "عدد افراد الاسرة",
              context: context,
              focusNode: KaidhaSub_Controller.numberOfFamilyFocus,
              containerKey: KaidhaSubscription_Controller.numberOfFamilyKey,
              isEmpty: KaidhaSub_Controller.isNumberOfFamilyEmpty,
              onChanged: (value) {
                if (value.isNotEmpty && KaidhaSub_Controller.isNumberOfFamilyEmpty) {
                  setState(() {
                    KaidhaSub_Controller.isNumberOfFamilyEmpty = false;
                  });
                }
              },
            ),

            // رقم بطاقة الأحوال
            _custom_number(
              hintText: "XXXXXX-XXXXX-X",
              obscureText: false,
              isNumber: false,
              mycontroller: KaidhaSub_Controller.identity_card_number,
              text: "رقم بطاقة الاحوال",
              context: context,
              focusNode: KaidhaSub_Controller.identityCardFocus,
              containerKey: KaidhaSubscription_Controller.identityCardKey,
              isEmpty: KaidhaSub_Controller.isIdentityCardEmpty,
              onChanged: (value) {
                if (value.isNotEmpty && KaidhaSub_Controller.isIdentityCardEmpty) {
                  setState(() {
                    KaidhaSub_Controller.isIdentityCardEmpty = false;
                  });
                }
              },
            ),

            _buildExpirationDateField(context, text: "تاريخ انتهاء الهوية"),

            SizedBox(height: 25),

            Text(
              "رقم الهاتف",
              textAlign: TextAlign.center,
              style: font14Black500W(context),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: Text(
                " Get.find<ProfileController>().User_Model!.phone.toString()",
                textAlign: TextAlign.center,
                style: font14Black500W(context),
              ),
            ),

            SizedBox(height: 20),

            _buildHouseType(context),

            SizedBox(height: 10),

            _customTextFormAuth(
              mycontroller: KaidhaSub_Controller.neighborhood,
              text: "الحي",
              context: context,
              focusNode: KaidhaSub_Controller.neighborhoodFocus,
              isEmpty: KaidhaSub_Controller.isNeighborhoodEmpty,
            ),

            // AddressDetailsWidget(addressDetails: address),

            // ===============

            SizedBox(height: 20),

            _customTextFormAuth(
              mycontroller: KaidhaSub_Controller.name_of_employer,
              text: "اسم جهة العمل",
              context: context,
              focusNode: KaidhaSub_Controller.employerFocus,
              isEmpty: KaidhaSub_Controller.isEmployerEmpty,
            ),

            _custom_number(
                mycontroller: KaidhaSub_Controller.total_salary,
                text: "الراتب الاجمالي",
                context: context,
                focusNode: KaidhaSub_Controller.totalSalaryFocus,
                containerKey: KaidhaSubscription_Controller.totalSalaryKey,
                isEmpty: KaidhaSub_Controller.isTotalSalaryEmpty,
                onChanged: (value) {
                  if (value.isNotEmpty && KaidhaSub_Controller.isTotalSalaryEmpty) {
                    setState(() {
                      KaidhaSub_Controller.isTotalSalaryEmpty = false;
                    });
                  }
                }),

            _buildInstallments(context),
          ],
        ),
      );
    });
  }

  Widget _buildInstallments(BuildContext context) {
    final KaidhaSub_Controller = Provider.of<KaidhaSubscription_Controller>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "هل لديك اقساط",
          textAlign: TextAlign.center,
          style: font14Black500W(context),
        ),
        Row(
          children: [
            _buildRadioOption(
              context: context,
              label: "نعم",
              value: "yes",
              groupValue: KaidhaSub_Controller.Installments,
              onChanged: (value) {
                KaidhaSub_Controller.updateInstallments(value!);
              },
            ),
            _buildRadioOption(
              context: context,
              label: "لا",
              value: "no",
              groupValue: KaidhaSub_Controller.Installments,
              onChanged: (value) {
                KaidhaSub_Controller.updateInstallments(value!);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMaritalStatusRadio(BuildContext context) {
    final KaidhaSub_Controller = Provider.of<KaidhaSubscription_Controller>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(
          context,
          text: "الحالة الاجتماعية",
          style: font11Black600W(context, size: size_14(context)),
        ),
        Row(
          children: [
            _buildRadioOption(
              context: context,
              label: "أعزب",
              value: "single",
              groupValue: KaidhaSub_Controller.marital_status,
              onChanged: (value) {
                KaidhaSub_Controller.updateMaritalStatus(value!);
              },
            ),
            _buildRadioOption(
              context: context,
              label: "متزوج",
              value: "married",
              groupValue: KaidhaSub_Controller.marital_status,
              onChanged: (value) {
                KaidhaSub_Controller.updateMaritalStatus(value!);
              },
            ),
            _buildRadioOption(
              context: context,
              label: "مطلق",
              value: "divorced",
              groupValue: KaidhaSub_Controller.marital_status,
              onChanged: (value) {
                KaidhaSub_Controller.updateMaritalStatus(value!);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHouseType(BuildContext context) {
    return Consumer<KaidhaSubscription_Controller>(
      builder: (context, KaidhaSubController, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_Text(context, text: "نوع المنزل", style: font11Black600W(context, size: size_14(context))),
          ...["منزل", "شقة", "فيلا"].map((type) => _buildRadioOption(
                context: context,
                label: type,
                value: type,
                groupValue: KaidhaSubController.house_type,
                onChanged: (v) {
                  KaidhaSubController.updateHousetype(v!);
                },
              )),
        ],
      ),
    );
  }

  Widget _buildRadioOption({
    required BuildContext context,
    required String label,
    required String value,
    required String? groupValue,
    required Function(String?) onChanged,
  }) {
    return Row(
      children: [
        RadioTheme(
          data: RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.greenColor;
              }
              return AppColors.gryColor_3;
            }),
          ),
          child: Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ),
        Custom_Text(
          context,
          text: label,
          style: font11Black500W(context, size: size_14(context)),
        )
      ],
    );
  }

  Widget _custom_number({
    String? hintText,
    final bool isNumber = false,
    final bool? obscureText,
    final TextEditingController? mycontroller,
    required String text,
    required BuildContext context,
    required FocusNode focusNode,
    required GlobalKey containerKey,
    required bool isEmpty,
    required Function(String value)? onChanged, // ✅ أضف هذا
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(context, text: text, style: font11Black500W(context, size: size_14(context))),
        SizedBox(height: 10),
        Focus(
          focusNode: focusNode,
          child: Container(
            key: containerKey,
            margin: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged(value);
                }
              },
              cursorColor: AppColors.bgColor,
              controller: mycontroller,
              obscureText: obscureText ?? false,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: font10Grey500W(context, size: size_14(context)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: isEmpty ? Colors.red : AppColors.gryColor_3,
                    width: isEmpty ? 1.5 : 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: isEmpty ? Colors.red : AppColors.greenColor,
                    width: isEmpty ? 1.5 : 1.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return 'يجب إدخال أرقام فقط';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _customTextFormAuth({
    String? hintText,
    bool isNumber = false,
    bool? obscureText,
    TextEditingController? mycontroller,
    required FocusNode? focusNode,
    required String text,
    required BuildContext context,
    required bool isEmpty,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(
          context,
          text: text,
          style: font11Black500W(context, size: size_14(context)),
        ),
        const SizedBox(height: 10),

        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: TextFormField(
            focusNode: focusNode,
            controller: mycontroller,
            keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
            cursorColor: AppColors.bgColor,
            obscureText: obscureText ?? false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              }
              return null;
            },
            onChanged: (value) {
              // تحديث الواجهة عند تغيير النص
              if (focusNode!.hasFocus) {
                setState(() {});
              }
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: font10Grey500W(context, size: size_14(context)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: isEmpty == true && mycontroller!.text.isEmpty ? Colors.red : AppColors.gryColor_3,
                  width: isEmpty ? 1.5 : 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: isEmpty == true && mycontroller!.text.isEmpty ? AppColors.redColor : AppColors.greenColor,
                  width: isEmpty ? 1.5 : 1.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: isEmpty ? Colors.red : AppColors.gryColor_3,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),

        //
      ],
    );
  }

  Widget _buildDate_old_10(BuildContext context, KaidhaSubscription_Controller KaidhaSub_Controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(
          context,
          text: "تاريخ الميلاد",
          style: font11Black500W(context, size: size_14(context)),
        ),
        SizedBox(height: 10),
        Focus(
          focusNode: KaidhaSub_Controller.birthDateFocus,
          child: Container(
            key: KaidhaSubscription_Controller.birthDateKey, // <-- مهم
            child: TextFormField(
              controller: TextEditingController(text: KaidhaSub_Controller.birthDate),
              readOnly: true,
              onTap: () {
                _selectDate_Old_10(context, KaidhaSub_Controller);
                KaidhaSub_Controller.isBirthDateEmpty = false;
                setState(() {});
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء اختيار تاريخ الميلاد';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'YYYY-MM-DD',
                hintStyle: font10Grey500W(context, size: size_14(context)),
                suffixIcon: Icon(Icons.calendar_today, color: AppColors.gryColor_3),
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: KaidhaSub_Controller.isBirthDateEmpty ? Colors.red : AppColors.gryColor_3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: KaidhaSub_Controller.isBirthDateEmpty ? Colors.red : AppColors.greenColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate_Old_10(BuildContext context, KaidhaSubscription_Controller controller) async {
    final DateTime today = DateTime.now();
    final DateTime maxAllowedDate = DateTime(today.year - 10, today.month, today.day); // الحد الأقصى (العمر >= 10)
    final DateTime firstDate = DateTime(today.year - 100); // الحد الأدنى (العمر <= 100)
    final DateTime initialDate =
        controller.birthDate != null ? DateTime.tryParse(controller.birthDate) ?? maxAllowedDate : maxAllowedDate;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: maxAllowedDate,
      locale: const Locale("en", "US"), // يمكن تغييره إلى Locale("ar", "SA") مثلاً
    );

    if (picked != null) {
      final String formattedDate =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      controller.updateBirthDate(formattedDate);
    }
  }

  Widget _buildExpirationDateField(BuildContext context, {String? text}) {
    final KaidhaSub_Controller = Provider.of<KaidhaSubscription_Controller>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(
          context,
          text: text ?? "تاريخ الانتهاء",
          style: font11Black500W(context, size: size_14(context)),
        ),
        SizedBox(height: 10),
        TextFormField(
          key: KaidhaSubscription_Controller.endDateKey,
          focusNode: KaidhaSub_Controller.endDateFocus,
          controller: TextEditingController(text: KaidhaSub_Controller.end_date),
          readOnly: true,
          onTap: () => _selectExpirationDate(context),
          decoration: InputDecoration(
            hintText: 'YYYY-MM-DD',
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            suffixIcon: Icon(Icons.calendar_today, color: AppColors.gryColor_3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: KaidhaSub_Controller.isEndDateEmpty ? Colors.red : AppColors.gryColor_3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color:
                    KaidhaSub_Controller.isEndDateEmpty && KaidhaSub_Controller.end_date.isEmpty ? Colors.red : AppColors.greenColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              KaidhaSub_Controller.isEndDateEmpty = true;
              setState(() {});

              // التمرير إلى الحقل
              Future.delayed(Duration(milliseconds: 100), () {
                Scrollable.ensureVisible(
                  KaidhaSubscription_Controller.endDateKey.currentContext!,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                KaidhaSub_Controller.endDateFocus.requestFocus();
              });

              return 'الرجاء اختيار تاريخ الانتهاء';
            }

            KaidhaSub_Controller.isEndDateEmpty = false;
            setState(() {});
            return null;
          },
        ),
      ],
    );
  }

  Future<void> _selectExpirationDate(BuildContext context) async {
    final DateTime today = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: DateTime(today.year + 30),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.greenColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formattedDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      Provider.of<KaidhaSubscription_Controller>(context, listen: false).updateExpirationDate(formattedDate);
    }
  }

  //
}
