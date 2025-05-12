// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class CustomSelection extends StatefulWidget {
  final String title;
  final List<String> options;
  final String? initialSelection;
  final ValueChanged<String> onSelected;

  const CustomSelection({
    super.key,
    required this.title,
    required this.options,
    this.initialSelection,
    required this.onSelected,
  });

  @override
  _CustomSelectionState createState() => _CustomSelectionState();
}

class _CustomSelectionState extends State<CustomSelection> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialSelection ?? widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          title: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(context, text: widget.title, style: font10Black600W(context)),
                SizedBox(height: 5),
                Custom_Text(context, text: "يجب اختيار 1 على الأقل", style: font10Grey600W(context, lineHeight: 2)),
                SizedBox(height: 5),
              ],
            ),
          ),
          trailing: const Icon(Icons.expand_more),
          children: widget.options.map((option) => _buildRadioTile(option)).toList(),
        ),
      ),
    );
  }

  Widget _buildRadioTile(String option) {
    return RadioListTile<String>(
      title: Custom_Text(context, text: option, style: font11Black400W(context)),
      value: option,
      groupValue: selectedOption,
      activeColor: Colors.green,
      onChanged: (value) {
        setState(() {
          selectedOption = value;
          widget.onSelected(value!);
        });
      },
    );
  }
}
