import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class SiteDropdownMenu extends StatefulWidget {
  final List<String> sites;

  const SiteDropdownMenu({super.key, required this.sites});

  @override
  State<SiteDropdownMenu> createState() => _SiteDropdownMenuState();
}

class _SiteDropdownMenuState extends State<SiteDropdownMenu> {
  String? currentSite;

  @override
  void initState() {
    super.initState();
    if (widget.sites.isNotEmpty) {
      currentSite = widget.sites.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: AppColors.backgroundColor,
      value: currentSite,
      isDense: true,
      icon: Icon(
        Icons.arrow_drop_down,
        size: 18,
        color: AppColors.secondaryColor,
      ),
      iconSize: 24,
      elevation: 0,
      style: font10Black300W(context, size: size_11(context)),
      onChanged: (String? newValue) {
        setState(() {
          currentSite = newValue!;
        });
      },
      items: widget.sites.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
