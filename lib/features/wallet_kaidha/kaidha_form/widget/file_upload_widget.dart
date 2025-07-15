// ignore_for_file: use_build_context_synchronously

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class FileUploadWidget extends StatefulWidget {
  const FileUploadWidget({super.key});

  @override
  FileUploadWidgetState createState() => FileUploadWidgetState();
}

class FileUploadWidgetState extends State<FileUploadWidget> {
  final List<PlatformFile> _files = [];
  final int _maxFiles = 5;

  Future<void> _pickFile() async {
    if (_files.length >= _maxFiles) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('لا يمكن رفع أكثر من $_maxFiles ملفات')),
      );
      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result != null) {
      int remainingSlots = _maxFiles - _files.length;
      var filesToAdd = result.files.take(remainingSlots).toList();

      for (var file in filesToAdd) {
        if (file.size <= 5 * 1024 * 1024) {
          setState(() {
            _files.add(file);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('الملف ${file.name} تجاوز الحد المسموح (5MB)')),
          );
        }
      }

      if (result.files.length > remainingSlots) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم إضافة $remainingSlots ملفات فقط')),
        );
      }
    }
  }

  void _removeFile(int index) {
    setState(() {
      _files.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _pickFile,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            dashPattern: [5, 5],
            color: AppColors.gryColor_4,
            strokeWidth: 2,
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload, size: 48, color: AppColors.greenColor),
                  SizedBox(height: 10),
                  Custom_Text(context, text: "اضغط هنا لرفع المستندات", style: font10Black400W(context, size: size_14(context))),
                  SizedBox(height: 5),
                  Custom_Text(context,
                      text: "(الحد الاقصى 5 ميجابايت ) pdf,jpg,png", style: font10Grey400W(context, size: size_14(context))),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        if (_files.isNotEmpty)
          Column(
            children: [
              ..._files.asMap().entries.map((entry) {
                int index = entry.key;
                PlatformFile file = entry.value;
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(color: AppColors.gryColor_3), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.insert_drive_file_outlined,
                        color: AppColors.greenColor,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(file.name),
                            Text(
                              '${(file.size / 1024 / 1024).toStringAsFixed(2)} MB',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline_outlined, color: AppColors.redColor),
                        onPressed: () => _removeFile(index),
                      ),
                    ],
                  ),
                );
              }),
              custom_Button(context,
                  title: "اضافة ملف آخر",
                  h: 50,
                  style: font16SecondaryColor700W(context),
                  buttoncolor: AppColors.backgroundColor,
                  bordersidecolor: AppColors.secondaryColor, onPressed: () {
                _files.length < _maxFiles ? _pickFile : null;
              }),
              Custom_Text(context,
                  text: 'ملفات تم رفعها ${_files.length}/$_maxFiles', style: font10Grey400W(context, size: size_14(context)))
            ],
          ),
      ],
    );
  }
}
